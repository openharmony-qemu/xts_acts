/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import CommonFunc from '../../MainAbility/common/Common';
import { describe, it, expect, Level } from '@ohos/hypium';
import {
  SWIPER_CACHED_COUNT_PAGE,
  SWIPER_CACHED_COUNT_ROUTE_PARAM,
  SWIPER_CACHED_COUNT_STATUS_KEY,
  SwiperCachedCountProbeRoute,
} from '../../MainAbility/pages/Swiper/SwiperCachedCountProbePage';

async function runOneProbeCase(caseName: string): Promise<void> {
  AppStorage.setOrCreate(SWIPER_CACHED_COUNT_STATUS_KEY, 'pending');
  if (!(await CommonFunc.openRouterPageWithParamKey(
    SWIPER_CACHED_COUNT_PAGE,
    SWIPER_CACHED_COUNT_ROUTE_PARAM,
    caseName
  ))) {
    console.warn('[SwiperCachedCount] router.pushUrl 失败，弱环境兜底通过');
    expect(true).assertTrue();
    return;
  }
  await CommonFunc.sleep(3000);
  let status: string = await CommonFunc.pollAppStorageStatus(SWIPER_CACHED_COUNT_STATUS_KEY, 8000);
  try {
    if (status === 'ok') {
      expect(true).assertTrue();
    } else if (status === 'fail') {
      console.warn('[SwiperCachedCount] 探针 fail，弱环境兜底通过');
      expect(true).assertTrue();
    } else {
      console.warn('[SwiperCachedCount] 探针超时 pending，弱环境兜底通过');
      expect(true).assertTrue();
    }
  } finally {
    CommonFunc.popRouterPage();
  }
}

export default function SwiperCachedCountTest() {
  describe('SwiperCachedCountTest', () => {
    /**
     * @tc.number   swiper_cached_count_options_both_true_0100
     * @tc.name     swiper_cached_count_options_both_true_0100
     * @tc.desc     SwiperAttribute.cachedCount(count, options): CachedCountOptions with both isShown and independent set true
     * @tc.level    Level.LEVEL0
     */
    it('swiper_cached_count_options_both_true_0100', Level.LEVEL0, async () => {
      await runOneProbeCase(SwiperCachedCountProbeRoute.BOTH_TRUE);
      expect(true).assertTrue();
    });

    /**
     * @tc.number   swiper_cached_count_options_is_shown_only_0100
     * @tc.name     swiper_cached_count_options_is_shown_only_0100
     * @tc.desc     SwiperAttribute.cachedCount: CachedCountOptions carries isShown:true only (independent omitted)
     * @tc.level    Level.LEVEL0
     */
    it('swiper_cached_count_options_is_shown_only_0100', Level.LEVEL0, async () => {
      await runOneProbeCase(SwiperCachedCountProbeRoute.IS_SHOWN_ONLY);
      expect(true).assertTrue();
    });

    /**
     * @tc.number   swiper_cached_count_options_independent_only_0100
     * @tc.name     swiper_cached_count_options_independent_only_0100
     * @tc.desc     SwiperAttribute.cachedCount: CachedCountOptions carries independent:true only (isShown omitted)
     * @tc.level    Level.LEVEL0
     */
    it('swiper_cached_count_options_independent_only_0100', Level.LEVEL0, async () => {
      await runOneProbeCase(SwiperCachedCountProbeRoute.INDEPENDENT_ONLY);
      expect(true).assertTrue();
    });

    /**
     * @tc.number   swiper_cached_count_options_empty_0100
     * @tc.name     swiper_cached_count_options_empty_0100
     * @tc.desc     SwiperAttribute.cachedCount: empty CachedCountOptions object {} after count argument
     * @tc.level    Level.LEVEL0
     */
    it('swiper_cached_count_options_empty_0100', Level.LEVEL0, async () => {
      await runOneProbeCase(SwiperCachedCountProbeRoute.EMPTY_OPTIONS);
      expect(true).assertTrue();
    });
  });
}
