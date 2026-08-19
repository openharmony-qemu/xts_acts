/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
declare module 'libnapiData.so' {
  export const createDate: (timestamp: number) => number;
  export const getDateValue: (dateValue: number) => number;
  export const isDate: (value: Date | number | string) => boolean;
  export const isDatePrototypeObject: () => boolean;
  export const isFrozenDate: () => boolean;
  export const isDateCrossRealm: () => boolean;
  export function isDateAfterExceptionClear(): boolean;
  export function isDateWithMultipleExceptions(): boolean;
  export function testDeleteCallsiteInfoNormalParams(): boolean;
  export function testDeleteCallsiteInfoCombination(): boolean;
  export function testGetModuleFileNameNormalParams(): boolean;
  export function testGetModuleFileNameAbnormalParams(): boolean;
  export function testGetModuleFileNameReturnValue(): boolean;
  export function testThrowBusinessErrorCombination(): boolean;
  export function testSerializeNullValue(): boolean;
  export function testSwitchArkContextReturnValue(): boolean;
  export function testGetModuleFileNameCombination(): boolean;
  export function testModuleRegisterCombination(): boolean;
}