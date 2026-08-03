/*
   * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
   * * Licensed under the Apache License, Version 2.0 (the "License");
   * * you may not use this file except in compliance with the License.
   * * You may obtain a copy of the License at
   * *
   * *
   * http://www.apache.org/licenses/LICENSE-2.0
   * *
   * * Unless required by applicable law or agreed to in writing, software
   * * distributed under the License is distributed on an "AS IS" BASIS,
   * * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   * * See the License for the specific language governing permissions and
   * * limitations under the License.
   *
 */

export const setConfigCookieSync: (url:string, cookieValue:string, incognito:boolean, includeHttpOnly:boolean) => number;
export const getFetchCookieSync: (url:string,  incognito:boolean, includeHttpOnly:boolean) => string;
export const saveCookieSync: () => number;
export const saveCookieSyncThread: () => number;
export const saveCookieAsyncNullptr: () => number;
export const saveCookieAsyncThread: () => number;
export const saveCookieAsyncCallback: () => number;
export const getSaveCookieSyncThreadResult: () => number;
export const getSaveCookieAsyncCallbackResult: () => number;
export const lazyInitializeWebEngineInCookieManagerSetTrue: () => number;
export const lazyInitializeWebEngineInCookieManagerSetFalse: () => number;
export const fetchCookieSyncPartitioned: (url:string, incognito:boolean, includeHttpOnly:boolean,
  includePartitionedCookies:boolean) => number;
export const getFetchCookieSyncPartitionedValue: () => string;
export const fetchCookieSyncPartitionedInvalidParam: (url:string, incognito:boolean, includeHttpOnly:boolean,
  includePartitionedCookies:boolean) => number;
export const fetchCookieAsyncPartitioned: (url:string, incognito:boolean, includeHttpOnly:boolean,
  includePartitionedCookies:boolean) => number;
export const fetchCookieAsyncPartitionedNullCallback: (url:string, incognito:boolean, includeHttpOnly:boolean,
  includePartitionedCookies:boolean) => number;
export const getFetchCookieAsyncPartitionedCode: () => number;
export const getFetchCookieAsyncPartitionedValue: () => string;
