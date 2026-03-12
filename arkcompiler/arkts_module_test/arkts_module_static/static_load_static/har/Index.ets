'use static'
/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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


export { MainPage } from './src/main/ets/components/MainPage'

export { add } from './src/main/ets/TestAdd';

// export { add as add1 } from './testAdd';  // 规格不支持，非src/main模块

export { subtract } from './src/main/ets/testFile';

export { multiply } from './src/main/ets/testFile';

export { addTest } from 'loadhar/Index';

// export { getHarName } from 'loadhar/src/main/ets/getHarNameTest';  // 问题已经提单，export +export  别名场景

// export { addTest as addTest2 } from '@test/library/Index';  // 问题已经提单，export +export  别名场景

export { getHarName as getHarName2 } from '@test/library/src/main/ets/GetHarNameTest';
