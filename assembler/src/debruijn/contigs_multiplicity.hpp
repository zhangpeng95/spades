#pragma once

#include <array>
#include <string>
#include <iostream>
#include "verify.hpp"
#include "path_extend/bidirectional_path.hpp"

namespace debruijn_graph {

static const size_t MAX_SAMPLE_CNT = 20;
static const uint INVALID_MPL = uint(-1);

class ContigAbundanceCounter {
private:

    typedef typename std::array<uint, MAX_SAMPLE_CNT> MplVector;
    typedef typename std::array<double, MAX_SAMPLE_CNT> AbundanceVector;
    typedef typename debruijn_graph::conj_graph_pack conj_graph_pack;
    typedef typename InvertableStoring::immutant_inverter<MplVector> InverterT;

    const conj_graph_pack& gp_;
    size_t k_;
    size_t sample_cnt_;
    InverterT inverter_;

    PerfectHashMap<conj_graph_pack::seq_t,
        MplVector,
        kmer_index_traits<conj_graph_pack::seq_t>,
        InvertableStoring> kmer_mpl_;

    void FillMplMap(const std::string& kmers_mpl_file) {
        //INFO("Fill start");
        for (auto it = kmer_mpl_.value_begin(); it != kmer_mpl_.value_end(); ++it) {
            it->fill(INVALID_MPL);
        }
//        std::ifstream kmers_in(kmers_mpl_file + ".kmer", std::ios::binary);
//        std::ifstream kmers_mpl_in(kmers_mpl_file + ".mpl", std::ios::binary);
        std::ifstream kmers_in(kmers_mpl_file + ".kmer");
        std::ifstream kmers_mpl_in(kmers_mpl_file + ".mpl");
        while (true) {
            std::string kmer_str;
            kmers_in >> kmer_str;
            if (kmers_in.fail()) {
                break;
            }

            VERIFY(kmer_str.length() == k_+1);
            conj_graph_pack::seq_t kp1mer(k_+1, kmer_str.c_str());
            kp1mer = gp_.kmer_mapper.Substitute(kp1mer);

            MplVector mpls;
            mpls.fill(INVALID_MPL);
//            kp1mer.BinRead(kmers_in);
            for (size_t i = 0; i < sample_cnt_; ++i) {
//                kmers_mpl_in.read((char*) &kmer_mpl[i], sizeof(uint));
                kmers_mpl_in >> mpls[i];
                VERIFY(!kmers_mpl_in.fail());
            }

            auto kwh = kmer_mpl_.ConstructKWH(kp1mer);
            if (gp_.index.inner_index().contains(kwh)) {
                kmer_mpl_.put_value(kwh, mpls, inverter_);
            }
        }
    }

    void AddToAbundances(std::vector<std::vector<uint32_t>>& storage, const MplVector kmer_mpls) const {
        bool invalid = (kmer_mpls[0] == INVALID_MPL);
        for (size_t i = 0; i < sample_cnt_; ++i) {
            if (invalid) {
                VERIFY(kmer_mpls[i] == INVALID_MPL);
            } else {
                VERIFY(kmer_mpls[i] != INVALID_MPL);
                storage[i].push_back(kmer_mpls[i]);
            }
        }
    };

    AbundanceVector PathAbundance(const path_extend::BidirectionalPath& path) const {
        std::vector<std::vector<uint>> abundance_storage(sample_cnt_);

        for (size_t i = 0; i < path.Size(); ++i) {
            Sequence seq = gp_.g.EdgeNucls(path[i]);
            VERIFY(seq.size() > k_);
            auto kwh = kmer_mpl_.ConstructKWH(conj_graph_pack::seq_t(k_+1, seq));
            kwh >>= 'A';

            for (size_t j = k_; j < seq.size(); ++j) {
                kwh <<= seq[j];
                VERIFY(gp_.index.inner_index().contains(kwh));
                AddToAbundances(abundance_storage, kmer_mpl_.get_value(kwh, inverter_));
            }
        }

        AbundanceVector contig_abundance;
        contig_abundance.fill(-1.);

        for (size_t i = 0; i < sample_cnt_; ++i) {
            std::sort(abundance_storage[i].begin(), abundance_storage[i].end());

            //set contig abundance as median across kmer multiplicities
            contig_abundance[i] = abundance_storage[i][abundance_storage[i].size() / 2];
        }
        return contig_abundance;
    }

public:
    ContigAbundanceCounter(const conj_graph_pack& gp,
                           size_t sample_cnt,
                           const std::string& kmers_mpl_file) :
                               gp_(gp), k_(gp_.k_value),
                               sample_cnt_(sample_cnt),
                               kmer_mpl_(gp_.index.k(),
                               gp_.index.inner_index().workdir(),
                               gp_.index.inner_index().index_ptr()) {
        INFO("Filling kmer multiplicities. Sample cnt " << sample_cnt);
        FillMplMap(kmers_mpl_file);
    }

    void operator()(const path_extend::PathContainer& paths,
                          const std::string& contigs_mpl_file) const {
        INFO("Calculating multiplicities");
        std::ofstream id_out(contigs_mpl_file + ".id");
        std::ofstream mpl_out(contigs_mpl_file + ".mpl");

        for (auto iter = paths.begin(); iter != paths.end(); ++iter) {
            const auto& path = *iter.get();
            INFO("Processing path " << path.GetId());
            VERIFY(path.Length() > 0);

            auto abundance_vec = PathAbundance(path);

            id_out << path.GetId() << std::endl;

            std::string delim = "";
            for (size_t i = 0; i < sample_cnt_; ++i) {
                mpl_out << delim << abundance_vec[i];
                delim = " ";
            }
            mpl_out << std::endl;
        }
        id_out.close();
        mpl_out.close();
    }
private:
    DECL_LOGGER("ContigAbundanceCounter");
};

}
