
/*
* Copyright (c) 2019, NVIDIA CORPORATION.  All rights reserved.
*
* NVIDIA CORPORATION and its licensors retain all intellectual property
* and proprietary rights in and to this software, related documentation
* and any modifications thereto.  Any use, reproduction, disclosure or
* distribution of this software and related documentation without an express
* license agreement from NVIDIA CORPORATION is strictly prohibited.
*/

#include "gtest/gtest.h"
#include "../src/index_cpu.hpp"
#include "../src/index_generator_cpu.hpp"
#include "../src/matcher.hpp"

namespace claragenomics {

    TEST(TestCudamapperMatcher, SampleTest) {
        IndexGeneratorCPU index_generator("data/one_read_one_minimizer.fasta", 4, 1);
        IndexCPU index(index_generator);
        Matcher matcher(index);
        ASSERT_EQ(true, true);
    }

}
