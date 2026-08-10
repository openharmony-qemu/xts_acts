/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Test initialization
export const initTests: () => number;

// One-to-one test bindings
export const VideoDecodeSyncSwMpeg4Func00100Test: () => Promise<number>;
export const VideoDecodeSyncSwMpeg4Func00200Test: () => Promise<number>;
export const VideoDecodeSyncSwMpeg4Func00400Test: () => Promise<number>;
export const VideoMpeg4SwdecBlankFrame00100Test: () => Promise<number>;
