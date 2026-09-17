/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

const TAG: string = '=== Stage Ability ==='

export default class Logger {
    public static log(tag: string, ...args: Record<string, Object>[]) {
        console.log(`${TAG}.${tag}: ${args.join('')}`)
    }

    public static info(tag: string, ...args: Record<string, Object>[]) {
        console.info(`${TAG}.${tag}: ${args.join('')}`)
    }

    public static debug(tag: string, ...args: Record<string, Object>[]) {
        console.debug(`${TAG}.${tag}: ${args.join('')}`)
    }

    public static warn(tag: string, ...args: Record<string, Object>[]) {
        console.warn(`${TAG}.${tag}: ${args.join('')}`)
    }

    public static error(tag: string, ...args: Record<string, Object>[]) {
        console.error(`${TAG}.${tag}: ${args.join('')}`)
    }
}