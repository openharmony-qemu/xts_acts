/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
export let URL1: string = 'http://'
export let URL2: string = 'httpbin.org/basic-auth/2222/3333'
export let URL3: string = 'www.example.com'
export let URL: string = URL1 + URL2
export let URL4: string = 'https://postman-echo.com/basic-auth'
export let URL5: string = 'https://testpages.eviltester.com/pages/auth/basic-auth/basic-auth-results.html'
export let BASIC_AUTH_PRIMARY_URL: string = URL
export let BASIC_AUTH_BACKUP_URL: string = URL5
export let BASIC_AUTH_PRIMARY_USER: string = '2222'
export let BASIC_AUTH_PRIMARY_PASS: string = '3333'
export let BASIC_AUTH_BACKUP_USER: string = 'authorized'
export let BASIC_AUTH_BACKUP_PASS: string = 'password001'