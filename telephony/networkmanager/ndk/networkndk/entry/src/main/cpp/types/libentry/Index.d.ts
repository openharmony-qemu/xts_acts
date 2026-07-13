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

import {connection} from '@kit.NetworkKit'

export const add: (a: number, b: number) => number;
export const ReFreshGlobalHttpProxy: (userData?: number, callback?: Function) => number;
export const TestRefreshGlobalHttpProxy401: (errorCodeType: number) => number;
export const TestRefreshGlobalHttpProxy201: () => number;
