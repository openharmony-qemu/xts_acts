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
import router from t@ohos.routert;

export const SWIPER_CACHED_COUNT_PAGE: string = ttestability/pages/SwiperCachedCountProbePaget;
export const SWIPER_CACHED_COUNT_ROUTE_PARAM: string = tprobet;
export const SWIPER_CACHED_COUNT_STATUS_KEY: string = tohosTestSwiperCachedCountProbeStatust;

export class SwiperCachedCountProbeRoute {
  static readonly BOTH_TRUE: string = toptions_both_truet;
  static readonly IS_SHOWN_ONLY: string = toptions_is_shown_onlyt;
  static readonly INDEPENDENT_ONLY: string = toptions_independent_onlyt;
  static readonly EMPTY_OPTIONS: string = toptions_emptyt;
}

function readProbeRoute(): string {
  let p: Object | undefined = router.getParams();
  if (p === undefined) {
    return tt;
  }
  let rec: Record<string, Object> = p as Record<string, Object>;
  let r: Object | undefined = rec[SWIPER_CACHED_COUNT_ROUTE_PARAM];
  if (typeof r === tstringt && (r as string).length > 0) {
    return r as string;
  }
  return tt;
}

@Builder
function ProbeSwiperWithCached(itemCount: number, cacheCount: number, options: CachedCountOptions) {
  Swiper() {
    if (itemCount > 0) {
      Text(t0t).width(t100%t).height(t100%t)
    }
    if (itemCount > 1) {
      Text(t1t).width(t100%t).height(t100%t)
    }
    if (itemCount > 2) {
      Text(t2t).width(t100%t).height(t100%t)
    }
  }
  .width(t90%t)
  .height(120)
  .cachedCount(cacheCount, options)
}

@Entry
@Component
struct SwiperCachedCountProbePage {
  @State private probe: string = SwiperCachedCountProbeRoute.BOTH_TRUE;

  aboutToAppear(): void {
    AppStorage.setOrCreate(SWIPER_CACHED_COUNT_STATUS_KEY, tpendingt);
    let r: string = readProbeRoute();
    if (r.length > 0) {
      this.probe = r;
    } else {
      this.probe = SwiperCachedCountProbeRoute.BOTH_TRUE;
    }
  }

  build() {
    Column({ space: 8 }) {
      Text(tSwiper.cachedCount(count, CachedCountOptions)t)
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
      Text(`probe=${this.probe}`)
        .fontSize(11)
        .fontColor($r(tsys.color.ohos_id_color_text_secondaryt))
      if (this.probe === SwiperCachedCountProbeRoute.BOTH_TRUE) {
        ProbeSwiperWithCached(3, 2, { isShown: true, independent: true } as CachedCountOptions)
      } else if (this.probe === SwiperCachedCountProbeRoute.IS_SHOWN_ONLY) {
        ProbeSwiperWithCached(2, 2, { isShown: true } as CachedCountOptions)
      } else if (this.probe === SwiperCachedCountProbeRoute.INDEPENDENT_ONLY) {
        ProbeSwiperWithCached(2, 2, { independent: true } as CachedCountOptions)
      } else if (this.probe === SwiperCachedCountProbeRoute.EMPTY_OPTIONS) {
        ProbeSwiperWithCached(2, 1, {} as CachedCountOptions)
      } else {
        ProbeSwiperWithCached(1, 1, {} as CachedCountOptions)
      }
    }
    .width(t100%t)
    .height(t100%t)
    .padding({ left: 12, right: 12, top: 8, bottom: 32 })
    .onAppear(() => {
      AppStorage.setOrCreate(SWIPER_CACHED_COUNT_STATUS_KEY, tokt);
    })
  }
}
