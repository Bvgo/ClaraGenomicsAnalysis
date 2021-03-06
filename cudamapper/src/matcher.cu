/*
* Copyright (c) 2019, NVIDIA CORPORATION.  All rights reserved.
*
* NVIDIA CORPORATION and its licensors retain all intellectual property
* and proprietary rights in and to this software, related documentation
* and any modifications thereto.  Any use, reproduction, disclosure or
* distribution of this software and related documentation without an express
* license agreement from NVIDIA CORPORATION is strictly prohibited.
*/

#include <claragenomics/cudamapper/matcher.hpp>
#include "matcher_gpu.cuh"

namespace claraparabricks
{

namespace genomeworks
{

namespace cudamapper
{

std::unique_ptr<Matcher> Matcher::create_matcher(DefaultDeviceAllocator allocator,
                                                 const Index& query_index,
                                                 const Index& target_index,
                                                 const cudaStream_t cuda_stream)
{
    return std::make_unique<MatcherGPU>(allocator,
                                        query_index,
                                        target_index,
                                        cuda_stream);
}

} // namespace cudamapper

} // namespace genomeworks

} // namespace claraparabricks
