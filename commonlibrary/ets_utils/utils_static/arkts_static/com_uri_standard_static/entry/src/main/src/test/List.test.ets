'use static';
/*
* Copyright (c) 2024-2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import uriTest1 from "./uri/Uri1.test";
import uriTest2 from "./uri/Uri2.test";
import uriTest3 from './uri/Uri3.test';
import uriEmojiTest from "./uri/Emoji_Uri.test";

import URI01Test from "./uri/URITest01.test";
import URI02Test from "./uri/URITest02.test";
import URI03Test from "./uri/URITest03.test";
import URI04Test from "./uri/URITest04.test";
import URI05Test from "./uri/URITest05.test";

export default function testsuite(): void {
    uriTest1();
    uriTest2();
    uriTest3();
    uriEmojiTest();

    URI01Test();
    URI02Test();
    URI03Test();
    URI04Test();
    URI05Test();
}
