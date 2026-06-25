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

import asset from '@ohos.security.asset';
import { StringToUint8Array } from '../common/CommonUtils';
import { Logger } from '../common/Logger';

export const MinGroupId = "group".padEnd(7, "01");

export const MaxGroupId = "group".padEnd(127, "1234567890_.");

export function CreateAssetMap(alias: string, secret: string): asset.AssetMap {
  let attr: asset.AssetMap = new Map();
  attr.set(asset.Tag.ALIAS, StringToUint8Array(alias));
  attr.set(asset.Tag.SECRET, StringToUint8Array(secret));
  attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);
  return attr;
}

export function CreateBatchAssetMaps(aliasPrefix: string, count: number): Array<asset.AssetMap> {
  let assetArray: Array<asset.AssetMap> = [];
  for (let i = 0; i < count; i++) {
    let attr: asset.AssetMap = CreateAssetMap(aliasPrefix + String(i), 'secret_' + String(i));
    assetArray.push(attr);
  }
  return assetArray;
}

export async function CleanAllAssets(): Promise<void> {
  try {
    await CleanLocalAssets();
    await CleanGroupAssets();
    Logger.info('CleanAllAssets: all assets removed');
  } catch (e) {
    Logger.info('CleanAllAssets: no assets to remove');
  }
}

export async function CleanGroupAssets(): Promise<void> {
  let queryAttr: asset.AssetMap = new Map();
  queryAttr.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ATTRIBUTES);
  let isRequireAttrEncrypted = [true, false];
  let groupIdArr = [MinGroupId, MaxGroupId];
  for (let i = 0; i < isRequireAttrEncrypted.length; i++) {
    queryAttr.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, isRequireAttrEncrypted[i]);
    for (let j = 0; j < groupIdArr.length; j++) {
      queryAttr.set(asset.Tag.GROUP_ID, StringToUint8Array(groupIdArr[j]));
      try {
        let results: asset.AssetMap[] = await asset.query(queryAttr);
        for (let result of results) {
          let alias = result.get(asset.Tag.ALIAS) as Uint8Array;
          let removeAttr: asset.AssetMap = new Map();
          removeAttr.set(asset.Tag.ALIAS, alias);
          removeAttr.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, isRequireAttrEncrypted[i]);
          removeAttr.set(asset.Tag.GROUP_ID, StringToUint8Array(groupIdArr[j]));
          await asset.remove(removeAttr);
        }
        Logger.info(`CleanGroupAssets[${i}][${j}]: group assets removed`);
      } catch (e) {
        Logger.error(`CleanGroupAssets[${i}][${j}]: no assets to remove`);
      }
    }
  }
}

export async function CleanLocalAssets(): Promise<void> {
  let queryAttr: asset.AssetMap = new Map();
  queryAttr.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ATTRIBUTES);
  let isRequireAttrEncrypted = [true, false];
  for (let i = 0; i < isRequireAttrEncrypted.length; i++) {
    queryAttr.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, isRequireAttrEncrypted[i]);
    try {
      let results: asset.AssetMap[] = await asset.query(queryAttr);
      for (let result of results) {
        let alias = result.get(asset.Tag.ALIAS) as Uint8Array;
        let removeAttr: asset.AssetMap = new Map();
        removeAttr.set(asset.Tag.ALIAS, alias);
        removeAttr.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, isRequireAttrEncrypted[i]);
        await asset.remove(removeAttr);
      }
      Logger.info(`CleanLocalAssets[${i}]: local assets removed`);
    } catch (e) {
      Logger.error(`CleanLocalAssets[${i}]: no assets to remove`);
    }
  }
}
