/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import huks from '@ohos.security.huks';
import { GetEmptyOptions, SetParam } from './HuksOptionsUtils';

export function GetWrapKeyOptions() {
  let huksOptions: huks.HuksOptions = GetEmptyOptions();
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_KEY_WRAP_TYPE, huks.HuksKeyWrapType.HUKS_KEY_WRAP_TYPE_HUK_BASED);
  return huksOptions;
}

export function GetGenWrapKeyOptions() {
  let huksOptions: huks.HuksOptions = GetEmptyOptions();
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_IS_ALLOWED_WRAP, true);
  return huksOptions;
}

export function GetWrapKeyGenerateOptions() {
  let huksOptions: huks.HuksOptions = GetEmptyOptions();
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256);
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_PURPOSE,
    huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE);
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC);
  SetParam(huksOptions, huks.HuksTag.HUKS_TAG_IS_ALLOWED_WRAP, true);
  return huksOptions;
}
