/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 */
#ifndef CENC_INFO_TEST_CASE_H
#define CENC_INFO_TEST_CASE_H

namespace OHOS
{
    namespace CencInfoUT
    {

        int TestCencInfo_Create_001();
        int TestCencInfo_Destroy_001();
        int TestCencInfo_Destroy_002();

        int TestCencInfo_SetAlgorithm_001();
        int TestCencInfo_SetAlgorithm_002();

        int TestCencInfo_SetKeyIdAndIv_001();
        int TestCencInfo_SetKeyIdAndIv_002();
        int TestCencInfo_SetKeyIdAndIv_003();
        int TestCencInfo_SetKeyIdAndIv_004();
        int TestCencInfo_SetKeyIdAndIv_005();
        int TestCencInfo_SetKeyIdAndIv_006();

        int TestCencInfo_SetSubsampleInfo_001();
        int TestCencInfo_SetSubsampleInfo_002();
        int TestCencInfo_SetSubsampleInfo_003();
        int TestCencInfo_SetSubsampleInfo_004();

        int TestCencInfo_SetMode_001();
        int TestCencInfo_SetMode_002();

        int TestCencInfo_SetAVBuffer_001();
        int TestCencInfo_SetAVBuffer_002();
        int TestCencInfo_SetAVBuffer_003();
    } // CencInfoUT
} // OHOS
#endif // CENC_INFO_TEST_CASE_H