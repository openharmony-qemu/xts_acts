'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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

import {
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType
} from '../../../../../hypium/index';

class Base23 {}
class Derived23 extends Base23 {}
function fooBB23<T23>(p: T23): T23 {return p}
function fooBD23<T23, G23 extends T23>(p: T23): G23 {return p as G23}
function fooDB23<G23 extends T23, T23>(p: G23): T23 { return p as T23};
function fooDD23<G23 extends T23, T23>(p: G23): G23 { return p};
function fooBBN23<T23>(p: T23, n: number): T23 {return p};
function fooBDN23<T23, G23 extends T23>(p: T23, n: number): G23 {return p as G23};
function fooDBN23<G23 extends T23, T23>(p: G23, n: number): T23 { return p as T23};
function fooDDN23<G23 extends T23, T23>(p: G23, n: number): G23 { return p};
function fooBBO23<T23>(p: T23, n?: number): T23 {return p};
function fooBDO23<T23, G23 extends T23>(p: T23, n?: number): G23 {return p as G23};
function fooDBO23<G23 extends T23, T23>(p: G23, n?: number): T23 { return p as T23};
function fooDDO23<G23 extends T23, T23>(p: G23, n?: number): G23 { return p};
function fooBBR23<T23>(p: T23, ...n: number[]): T23 {return p};
function fooBDR23<T23, G23 extends T23>(p: T23, ...n: number[]): G23 {return p as G23};
function fooDBR23<G23 extends T23, T23>(p: G23, ...n: number[]): T23 { return p as T23};
function fooDDR23<G23 extends T23, T23>(p: G23, ...n: number[]): G23 { return p};
let foobb23 = fooBB23<Base23>
let foobd23 = fooBD23<Base23,Derived23>
let foodb23 = fooDB23<Derived23,Base23>
let foodd23 = fooDD23<Derived23,Derived23>
let foobbn23 = fooBBN23<Base23>
let foobdn23 = fooBDN23<Base23,Derived23>
let foodbn23 = fooDBN23<Derived23,Base23>
let fooddn23 = fooDDN23<Derived23,Derived23>
let foobbo23 = fooBBO23<Base23>
let foobdo23 = fooBDO23<Base23,Derived23>
let foodbo23 = fooDBO23<Derived23,Base23>
let fooddo23 = fooDDO23<Derived23,Derived23>
let foobbr23 = fooBBR23<Base23>
let foobdr23 = fooBDR23<Base23,Derived23>
let foodbr23 = fooDBR23<Derived23,Base23>
let fooddr23 = fooDDR23<Derived23,Derived23>
foodd23 = foobd23

class Base24 {}
class Derived24 extends Base24 {}
function fooBB24<T24>(p: T24): T24 {return p}
function fooBD24<T24, G24 extends T24>(p: T24): G24 {return p as G24}
function fooDB24<G24 extends T24, T24>(p: G24): T24 { return p as T24};
function fooDD24<G24 extends T24, T24>(p: G24): G24 { return p};
function fooBBN24<T24>(p: T24, n: number): T24 {return p};
function fooBDN24<T24, G24 extends T24>(p: T24, n: number): G24 {return p as G24};
function fooDBN24<G24 extends T24, T24>(p: G24, n: number): T24 { return p as T24};
function fooDDN24<G24 extends T24, T24>(p: G24, n: number): G24 { return p};
function fooBBO24<T24>(p: T24, n?: number): T24 {return p};
function fooBDO24<T24, G24 extends T24>(p: T24, n?: number): G24 {return p as G24};
function fooDBO24<G24 extends T24, T24>(p: G24, n?: number): T24 { return p as T24};
function fooDDO24<G24 extends T24, T24>(p: G24, n?: number): G24 { return p};
function fooBBR24<T24>(p: T24, ...n: number[]): T24 {return p};
function fooBDR24<T24, G24 extends T24>(p: T24, ...n: number[]): G24 {return p as G24};
function fooDBR24<G24 extends T24, T24>(p: G24, ...n: number[]): T24 { return p as T24};
function fooDDR24<G24 extends T24, T24>(p: G24, ...n: number[]): G24 { return p};
let foobb24 = fooBB24<Base24>
let foobd24 = fooBD24<Base24,Derived24>
let foodb24 = fooDB24<Derived24,Base24>
let foodd24 = fooDD24<Derived24,Derived24>
let foobbn24 = fooBBN24<Base24>
let foobdn24 = fooBDN24<Base24,Derived24>
let foodbn24 = fooDBN24<Derived24,Base24>
let fooddn24 = fooDDN24<Derived24,Derived24>
let foobbo24 = fooBBO24<Base24>
let foobdo24 = fooBDO24<Base24,Derived24>
let foodbo24 = fooDBO24<Derived24,Base24>
let fooddo24 = fooDDO24<Derived24,Derived24>
let foobbr24 = fooBBR24<Base24>
let foobdr24 = fooBDR24<Base24,Derived24>
let foodbr24 = fooDBR24<Derived24,Base24>
let fooddr24 = fooDDR24<Derived24,Derived24>
foobbn24 = foobb24

class Base25 {}
class Derived25 extends Base25 {}
function fooBB25<T25>(p: T25): T25 {return p}
function fooBD25<T25, G25 extends T25>(p: T25): G25 {return p as G25}
function fooDB25<G25 extends T25, T25>(p: G25): T25 { return p as T25};
function fooDD25<G25 extends T25, T25>(p: G25): G25 { return p};
function fooBBN25<T25>(p: T25, n: number): T25 {return p};
function fooBDN25<T25, G25 extends T25>(p: T25, n: number): G25 {return p as G25};
function fooDBN25<G25 extends T25, T25>(p: G25, n: number): T25 { return p as T25};
function fooDDN25<G25 extends T25, T25>(p: G25, n: number): G25 { return p};
function fooBBO25<T25>(p: T25, n?: number): T25 {return p};
function fooBDO25<T25, G25 extends T25>(p: T25, n?: number): G25 {return p as G25};
function fooDBO25<G25 extends T25, T25>(p: G25, n?: number): T25 { return p as T25};
function fooDDO25<G25 extends T25, T25>(p: G25, n?: number): G25 { return p};
function fooBBR25<T25>(p: T25, ...n: number[]): T25 {return p};
function fooBDR25<T25, G25 extends T25>(p: T25, ...n: number[]): G25 {return p as G25};
function fooDBR25<G25 extends T25, T25>(p: G25, ...n: number[]): T25 { return p as T25};
function fooDDR25<G25 extends T25, T25>(p: G25, ...n: number[]): G25 { return p};
let foobb25 = fooBB25<Base25>
let foobd25 = fooBD25<Base25,Derived25>
let foodb25 = fooDB25<Derived25,Base25>
let foodd25 = fooDD25<Derived25,Derived25>
let foobbn25 = fooBBN25<Base25>
let foobdn25 = fooBDN25<Base25,Derived25>
let foodbn25 = fooDBN25<Derived25,Base25>
let fooddn25 = fooDDN25<Derived25,Derived25>
let foobbo25 = fooBBO25<Base25>
let foobdo25 = fooBDO25<Base25,Derived25>
let foodbo25 = fooDBO25<Derived25,Base25>
let fooddo25 = fooDDO25<Derived25,Derived25>
let foobbr25 = fooBBR25<Base25>
let foobdr25 = fooBDR25<Base25,Derived25>
let foodbr25 = fooDBR25<Derived25,Base25>
let fooddr25 = fooDDR25<Derived25,Derived25>
foobbo25 = foobb25

class Base26 {}
class Derived26 extends Base26 {}
function fooBB26<T26>(p: T26): T26 {return p}
function fooBD26<T26, G26 extends T26>(p: T26): G26 {return p as G26}
function fooDB26<G26 extends T26, T26>(p: G26): T26 { return p as T26};
function fooDD26<G26 extends T26, T26>(p: G26): G26 { return p};
function fooBBN26<T26>(p: T26, n: number): T26 {return p};
function fooBDN26<T26, G26 extends T26>(p: T26, n: number): G26 {return p as G26};
function fooDBN26<G26 extends T26, T26>(p: G26, n: number): T26 { return p as T26};
function fooDDN26<G26 extends T26, T26>(p: G26, n: number): G26 { return p};
function fooBBO26<T26>(p: T26, n?: number): T26 {return p};
function fooBDO26<T26, G26 extends T26>(p: T26, n?: number): G26 {return p as G26};
function fooDBO26<G26 extends T26, T26>(p: G26, n?: number): T26 { return p as T26};
function fooDDO26<G26 extends T26, T26>(p: G26, n?: number): G26 { return p};
function fooBBR26<T26>(p: T26, ...n: number[]): T26 {return p};
function fooBDR26<T26, G26 extends T26>(p: T26, ...n: number[]): G26 {return p as G26};
function fooDBR26<G26 extends T26, T26>(p: G26, ...n: number[]): T26 { return p as T26};
function fooDDR26<G26 extends T26, T26>(p: G26, ...n: number[]): G26 { return p};
let foobb26 = fooBB26<Base26>
let foobd26 = fooBD26<Base26,Derived26>
let foodb26 = fooDB26<Derived26,Base26>
let foodd26 = fooDD26<Derived26,Derived26>
let foobbn26 = fooBBN26<Base26>
let foobdn26 = fooBDN26<Base26,Derived26>
let foodbn26 = fooDBN26<Derived26,Base26>
let fooddn26 = fooDDN26<Derived26,Derived26>
let foobbo26 = fooBBO26<Base26>
let foobdo26 = fooBDO26<Base26,Derived26>
let foodbo26 = fooDBO26<Derived26,Base26>
let fooddo26 = fooDDO26<Derived26,Derived26>
let foobbr26 = fooBBR26<Base26>
let foobdr26 = fooBDR26<Base26,Derived26>
let foodbr26 = fooDBR26<Derived26,Base26>
let fooddr26 = fooDDR26<Derived26,Derived26>
foobbn26 = foobd26

class Base27 {}
class Derived27 extends Base27 {}
function fooBB27<T27>(p: T27): T27 {return p}
function fooBD27<T27, G27 extends T27>(p: T27): G27 {return p as G27}
function fooDB27<G27 extends T27, T27>(p: G27): T27 { return p as T27};
function fooDD27<G27 extends T27, T27>(p: G27): G27 { return p};
function fooBBN27<T27>(p: T27, n: number): T27 {return p};
function fooBDN27<T27, G27 extends T27>(p: T27, n: number): G27 {return p as G27};
function fooDBN27<G27 extends T27, T27>(p: G27, n: number): T27 { return p as T27};
function fooDDN27<G27 extends T27, T27>(p: G27, n: number): G27 { return p};
function fooBBO27<T27>(p: T27, n?: number): T27 {return p};
function fooBDO27<T27, G27 extends T27>(p: T27, n?: number): G27 {return p as G27};
function fooDBO27<G27 extends T27, T27>(p: G27, n?: number): T27 { return p as T27};
function fooDDO27<G27 extends T27, T27>(p: G27, n?: number): G27 { return p};
function fooBBR27<T27>(p: T27, ...n: number[]): T27 {return p};
function fooBDR27<T27, G27 extends T27>(p: T27, ...n: number[]): G27 {return p as G27};
function fooDBR27<G27 extends T27, T27>(p: G27, ...n: number[]): T27 { return p as T27};
function fooDDR27<G27 extends T27, T27>(p: G27, ...n: number[]): G27 { return p};
let foobb27 = fooBB27<Base27>
let foobd27 = fooBD27<Base27,Derived27>
let foodb27 = fooDB27<Derived27,Base27>
let foodd27 = fooDD27<Derived27,Derived27>
let foobbn27 = fooBBN27<Base27>
let foobdn27 = fooBDN27<Base27,Derived27>
let foodbn27 = fooDBN27<Derived27,Base27>
let fooddn27 = fooDDN27<Derived27,Derived27>
let foobbo27 = fooBBO27<Base27>
let foobdo27 = fooBDO27<Base27,Derived27>
let foodbo27 = fooDBO27<Derived27,Base27>
let fooddo27 = fooDDO27<Derived27,Derived27>
let foobbr27 = fooBBR27<Base27>
let foobdr27 = fooBDR27<Base27,Derived27>
let foodbr27 = fooDBR27<Derived27,Base27>
let fooddr27 = fooDDR27<Derived27,Derived27>
foobbn27 = foobb27

class Base28 {}
class Derived28 extends Base28 {}
function fooBB28<T28>(p: T28): T28 {return p}
function fooBD28<T28, G28 extends T28>(p: T28): G28 {return p as G28}
function fooDB28<G28 extends T28, T28>(p: G28): T28 { return p as T28};
function fooDD28<G28 extends T28, T28>(p: G28): G28 { return p};
function fooBBN28<T28>(p: T28, n: number): T28 {return p};
function fooBDN28<T28, G28 extends T28>(p: T28, n: number): G28 {return p as G28};
function fooDBN28<G28 extends T28, T28>(p: G28, n: number): T28 { return p as T28};
function fooDDN28<G28 extends T28, T28>(p: G28, n: number): G28 { return p};
function fooBBO28<T28>(p: T28, n?: number): T28 {return p};
function fooBDO28<T28, G28 extends T28>(p: T28, n?: number): G28 {return p as G28};
function fooDBO28<G28 extends T28, T28>(p: G28, n?: number): T28 { return p as T28};
function fooDDO28<G28 extends T28, T28>(p: G28, n?: number): G28 { return p};
function fooBBR28<T28>(p: T28, ...n: number[]): T28 {return p};
function fooBDR28<T28, G28 extends T28>(p: T28, ...n: number[]): G28 {return p as G28};
function fooDBR28<G28 extends T28, T28>(p: G28, ...n: number[]): T28 { return p as T28};
function fooDDR28<G28 extends T28, T28>(p: G28, ...n: number[]): G28 { return p};
let foobb28 = fooBB28<Base28>
let foobd28 = fooBD28<Base28,Derived28>
let foodb28 = fooDB28<Derived28,Base28>
let foodd28 = fooDD28<Derived28,Derived28>
let foobbn28 = fooBBN28<Base28>
let foobdn28 = fooBDN28<Base28,Derived28>
let foodbn28 = fooDBN28<Derived28,Base28>
let fooddn28 = fooDDN28<Derived28,Derived28>
let foobbo28 = fooBBO28<Base28>
let foobdo28 = fooBDO28<Base28,Derived28>
let foodbo28 = fooDBO28<Derived28,Base28>
let fooddo28 = fooDDO28<Derived28,Derived28>
let foobbr28 = fooBBR28<Base28>
let foobdr28 = fooBDR28<Base28,Derived28>
let foodbr28 = fooDBR28<Derived28,Base28>
let fooddr28 = fooDDR28<Derived28,Derived28>
foodbn28 = foobd28

class Base29 {}
class Derived29 extends Base29 {}
function fooBB29<T29>(p: T29): T29 {return p}
function fooBD29<T29, G29 extends T29>(p: T29): G29 {return p as G29}
function fooDB29<G29 extends T29, T29>(p: G29): T29 { return p as T29};
function fooDD29<G29 extends T29, T29>(p: G29): G29 { return p};
function fooBBN29<T29>(p: T29, n: number): T29 {return p};
function fooBDN29<T29, G29 extends T29>(p: T29, n: number): G29 {return p as G29};
function fooDBN29<G29 extends T29, T29>(p: G29, n: number): T29 { return p as T29};
function fooDDN29<G29 extends T29, T29>(p: G29, n: number): G29 { return p};
function fooBBO29<T29>(p: T29, n?: number): T29 {return p};
function fooBDO29<T29, G29 extends T29>(p: T29, n?: number): G29 {return p as G29};
function fooDBO29<G29 extends T29, T29>(p: G29, n?: number): T29 { return p as T29};
function fooDDO29<G29 extends T29, T29>(p: G29, n?: number): G29 { return p};
function fooBBR29<T29>(p: T29, ...n: number[]): T29 {return p};
function fooBDR29<T29, G29 extends T29>(p: T29, ...n: number[]): G29 {return p as G29};
function fooDBR29<G29 extends T29, T29>(p: G29, ...n: number[]): T29 { return p as T29};
function fooDDR29<G29 extends T29, T29>(p: G29, ...n: number[]): G29 { return p};
let foobb29 = fooBB29<Base29>
let foobd29 = fooBD29<Base29,Derived29>
let foodb29 = fooDB29<Derived29,Base29>
let foodd29 = fooDD29<Derived29,Derived29>
let foobbn29 = fooBBN29<Base29>
let foobdn29 = fooBDN29<Base29,Derived29>
let foodbn29 = fooDBN29<Derived29,Base29>
let fooddn29 = fooDDN29<Derived29,Derived29>
let foobbo29 = fooBBO29<Base29>
let foobdo29 = fooBDO29<Base29,Derived29>
let foodbo29 = fooDBO29<Derived29,Base29>
let fooddo29 = fooDDO29<Derived29,Derived29>
let foobbr29 = fooBBR29<Base29>
let foobdr29 = fooBDR29<Base29,Derived29>
let foodbr29 = fooDBR29<Derived29,Base29>
let fooddr29 = fooDDR29<Derived29,Derived29>
foodbo29 = foobd29

class Base30 {}
class Derived30 extends Base30 {}
function fooBB30<T30>(p: T30): T30 {return p}
function fooBD30<T30, G30 extends T30>(p: T30): G30 {return p as G30}
function fooDB30<G30 extends T30, T30>(p: G30): T30 { return p as T30};
function fooDD30<G30 extends T30, T30>(p: G30): G30 { return p};
function fooBBN30<T30>(p: T30, n: number): T30 {return p};
function fooBDN30<T30, G30 extends T30>(p: T30, n: number): G30 {return p as G30};
function fooDBN30<G30 extends T30, T30>(p: G30, n: number): T30 { return p as T30};
function fooDDN30<G30 extends T30, T30>(p: G30, n: number): G30 { return p};
function fooBBO30<T30>(p: T30, n?: number): T30 {return p};
function fooBDO30<T30, G30 extends T30>(p: T30, n?: number): G30 {return p as G30};
function fooDBO30<G30 extends T30, T30>(p: G30, n?: number): T30 { return p as T30};
function fooDDO30<G30 extends T30, T30>(p: G30, n?: number): G30 { return p};
function fooBBR30<T30>(p: T30, ...n: number[]): T30 {return p};
function fooBDR30<T30, G30 extends T30>(p: T30, ...n: number[]): G30 {return p as G30};
function fooDBR30<G30 extends T30, T30>(p: G30, ...n: number[]): T30 { return p as T30};
function fooDDR30<G30 extends T30, T30>(p: G30, ...n: number[]): G30 { return p};
let foobb30 = fooBB30<Base30>
let foobd30 = fooBD30<Base30,Derived30>
let foodb30 = fooDB30<Derived30,Base30>
let foodd30 = fooDD30<Derived30,Derived30>
let foobbn30 = fooBBN30<Base30>
let foobdn30 = fooBDN30<Base30,Derived30>
let foodbn30 = fooDBN30<Derived30,Base30>
let fooddn30 = fooDDN30<Derived30,Derived30>
let foobbo30 = fooBBO30<Base30>
let foobdo30 = fooBDO30<Base30,Derived30>
let foodbo30 = fooDBO30<Derived30,Base30>
let fooddo30 = fooDDO30<Derived30,Derived30>
let foobbr30 = fooBBR30<Base30>
let foobdr30 = fooBDR30<Base30,Derived30>
let foodbr30 = fooDBR30<Derived30,Base30>
let fooddr30 = fooDDR30<Derived30,Derived30>
foodbn30 = fooddn30

class Base31 {}
class Derived31 extends Base31 {}
function fooBB31<T31>(p: T31): T31 {return p}
function fooBD31<T31, G31 extends T31>(p: T31): G31 {return p as G31}
function fooDB31<G31 extends T31, T31>(p: G31): T31 { return p as T31};
function fooDD31<G31 extends T31, T31>(p: G31): G31 { return p};
function fooBBN31<T31>(p: T31, n: number): T31 {return p};
function fooBDN31<T31, G31 extends T31>(p: T31, n: number): G31 {return p as G31};
function fooDBN31<G31 extends T31, T31>(p: G31, n: number): T31 { return p as T31};
function fooDDN31<G31 extends T31, T31>(p: G31, n: number): G31 { return p};
function fooBBO31<T31>(p: T31, n?: number): T31 {return p};
function fooBDO31<T31, G31 extends T31>(p: T31, n?: number): G31 {return p as G31};
function fooDBO31<G31 extends T31, T31>(p: G31, n?: number): T31 { return p as T31};
function fooDDO31<G31 extends T31, T31>(p: G31, n?: number): G31 { return p};
function fooBBR31<T31>(p: T31, ...n: number[]): T31 {return p};
function fooBDR31<T31, G31 extends T31>(p: T31, ...n: number[]): G31 {return p as G31};
function fooDBR31<G31 extends T31, T31>(p: G31, ...n: number[]): T31 { return p as T31};
function fooDDR31<G31 extends T31, T31>(p: G31, ...n: number[]): G31 { return p};
let foobb31 = fooBB31<Base31>
let foobd31 = fooBD31<Base31,Derived31>
let foodb31 = fooDB31<Derived31,Base31>
let foodd31 = fooDD31<Derived31,Derived31>
let foobbn31 = fooBBN31<Base31>
let foobdn31 = fooBDN31<Base31,Derived31>
let foodbn31 = fooDBN31<Derived31,Base31>
let fooddn31 = fooDDN31<Derived31,Derived31>
let foobbo31 = fooBBO31<Base31>
let foobdo31 = fooBDO31<Base31,Derived31>
let foodbo31 = fooDBO31<Derived31,Base31>
let fooddo31 = fooDDO31<Derived31,Derived31>
let foobbr31 = fooBBR31<Base31>
let foobdr31 = fooBDR31<Base31,Derived31>
let foodbr31 = fooDBR31<Derived31,Base31>
let fooddr31 = fooDDR31<Derived31,Derived31>
foodbo31 = fooddo31

class Base32 {}
class Derived32 extends Base32 {}
function fooBB32<T32>(p: T32): T32 {return p}
function fooBD32<T32, G32 extends T32>(p: T32): G32 {return p as G32}
function fooDB32<G32 extends T32, T32>(p: G32): T32 { return p as T32};
function fooDD32<G32 extends T32, T32>(p: G32): G32 { return p};
function fooBBN32<T32>(p: T32, n: number): T32 {return p};
function fooBDN32<T32, G32 extends T32>(p: T32, n: number): G32 {return p as G32};
function fooDBN32<G32 extends T32, T32>(p: G32, n: number): T32 { return p as T32};
function fooDDN32<G32 extends T32, T32>(p: G32, n: number): G32 { return p};
function fooBBO32<T32>(p: T32, n?: number): T32 {return p};
function fooBDO32<T32, G32 extends T32>(p: T32, n?: number): G32 {return p as G32};
function fooDBO32<G32 extends T32, T32>(p: G32, n?: number): T32 { return p as T32};
function fooDDO32<G32 extends T32, T32>(p: G32, n?: number): G32 { return p};
function fooBBR32<T32>(p: T32, ...n: number[]): T32 {return p};
function fooBDR32<T32, G32 extends T32>(p: T32, ...n: number[]): G32 {return p as G32};
function fooDBR32<G32 extends T32, T32>(p: G32, ...n: number[]): T32 { return p as T32};
function fooDDR32<G32 extends T32, T32>(p: G32, ...n: number[]): G32 { return p};
let foobb32 = fooBB32<Base32>
let foobd32 = fooBD32<Base32,Derived32>
let foodb32 = fooDB32<Derived32,Base32>
let foodd32 = fooDD32<Derived32,Derived32>
let foobbn32 = fooBBN32<Base32>
let foobdn32 = fooBDN32<Base32,Derived32>
let foodbn32 = fooDBN32<Derived32,Base32>
let fooddn32 = fooDDN32<Derived32,Derived32>
let foobbo32 = fooBBO32<Base32>
let foobdo32 = fooBDO32<Base32,Derived32>
let foodbo32 = fooDBO32<Derived32,Base32>
let fooddo32 = fooDDO32<Derived32,Derived32>
let foobbr32 = fooBBR32<Base32>
let foobdr32 = fooBDR32<Base32,Derived32>
let foodbr32 = fooDBR32<Derived32,Base32>
let fooddr32 = fooDDR32<Derived32,Derived32>
foodbr32 = fooddr32

class Base33 {}
class Derived33 extends Base33 {}
function fooBB33<T33>(p: T33): T33 {return p}
function fooBD33<T33, G33 extends T33>(p: T33): G33 {return p as G33}
function fooDB33<G33 extends T33, T33>(p: G33): T33 { return p as T33};
function fooDD33<G33 extends T33, T33>(p: G33): G33 { return p};
function fooBBN33<T33>(p: T33, n: number): T33 {return p};
function fooBDN33<T33, G33 extends T33>(p: T33, n: number): G33 {return p as G33};
function fooDBN33<G33 extends T33, T33>(p: G33, n: number): T33 { return p as T33};
function fooDDN33<G33 extends T33, T33>(p: G33, n: number): G33 { return p};
function fooBBO33<T33>(p: T33, n?: number): T33 {return p};
function fooBDO33<T33, G33 extends T33>(p: T33, n?: number): G33 {return p as G33};
function fooDBO33<G33 extends T33, T33>(p: G33, n?: number): T33 { return p as T33};
function fooDDO33<G33 extends T33, T33>(p: G33, n?: number): G33 { return p};
function fooBBR33<T33>(p: T33, ...n: number[]): T33 {return p};
function fooBDR33<T33, G33 extends T33>(p: T33, ...n: number[]): G33 {return p as G33};
function fooDBR33<G33 extends T33, T33>(p: G33, ...n: number[]): T33 { return p as T33};
function fooDDR33<G33 extends T33, T33>(p: G33, ...n: number[]): G33 { return p};
let foobb33 = fooBB33<Base33>
let foobd33 = fooBD33<Base33,Derived33>
let foodb33 = fooDB33<Derived33,Base33>
let foodd33 = fooDD33<Derived33,Derived33>
let foobbn33 = fooBBN33<Base33>
let foobdn33 = fooBDN33<Base33,Derived33>
let foodbn33 = fooDBN33<Derived33,Base33>
let fooddn33 = fooDDN33<Derived33,Derived33>
let foobbo33 = fooBBO33<Base33>
let foobdo33 = fooBDO33<Base33,Derived33>
let foodbo33 = fooDBO33<Derived33,Base33>
let fooddo33 = fooDDO33<Derived33,Derived33>
let foobbr33 = fooBBR33<Base33>
let foobdr33 = fooBDR33<Base33,Derived33>
let foodbr33 = fooDBR33<Derived33,Base33>
let fooddr33 = fooDDR33<Derived33,Derived33>
foodbn33 = foobdn33

class Base34 {}
class Derived34 extends Base34 {}
function fooBB34<T34>(p: T34): T34 {return p}
function fooBD34<T34, G34 extends T34>(p: T34): G34 {return p as G34}
function fooDB34<G34 extends T34, T34>(p: G34): T34 { return p as T34};
function fooDD34<G34 extends T34, T34>(p: G34): G34 { return p};
function fooBBN34<T34>(p: T34, n: number): T34 {return p};
function fooBDN34<T34, G34 extends T34>(p: T34, n: number): G34 {return p as G34};
function fooDBN34<G34 extends T34, T34>(p: G34, n: number): T34 { return p as T34};
function fooDDN34<G34 extends T34, T34>(p: G34, n: number): G34 { return p};
function fooBBO34<T34>(p: T34, n?: number): T34 {return p};
function fooBDO34<T34, G34 extends T34>(p: T34, n?: number): G34 {return p as G34};
function fooDBO34<G34 extends T34, T34>(p: G34, n?: number): T34 { return p as T34};
function fooDDO34<G34 extends T34, T34>(p: G34, n?: number): G34 { return p};
function fooBBR34<T34>(p: T34, ...n: number[]): T34 {return p};
function fooBDR34<T34, G34 extends T34>(p: T34, ...n: number[]): G34 {return p as G34};
function fooDBR34<G34 extends T34, T34>(p: G34, ...n: number[]): T34 { return p as T34};
function fooDDR34<G34 extends T34, T34>(p: G34, ...n: number[]): G34 { return p};
let foobb34 = fooBB34<Base34>
let foobd34 = fooBD34<Base34,Derived34>
let foodb34 = fooDB34<Derived34,Base34>
let foodd34 = fooDD34<Derived34,Derived34>
let foobbn34 = fooBBN34<Base34>
let foobdn34 = fooBDN34<Base34,Derived34>
let foodbn34 = fooDBN34<Derived34,Base34>
let fooddn34 = fooDDN34<Derived34,Derived34>
let foobbo34 = fooBBO34<Base34>
let foobdo34 = fooBDO34<Base34,Derived34>
let foodbo34 = fooDBO34<Derived34,Base34>
let fooddo34 = fooDDO34<Derived34,Derived34>
let foobbr34 = fooBBR34<Base34>
let foobdr34 = fooBDR34<Base34,Derived34>
let foodbr34 = fooDBR34<Derived34,Base34>
let fooddr34 = fooDDR34<Derived34,Derived34>
foodbo34 = foobdo34

class Base35 {}
class Derived35 extends Base35 {}
function fooBB35<T35>(p: T35): T35 {return p}
function fooBD35<T35, G35 extends T35>(p: T35): G35 {return p as G35}
function fooDB35<G35 extends T35, T35>(p: G35): T35 { return p as T35};
function fooDD35<G35 extends T35, T35>(p: G35): G35 { return p};
function fooBBN35<T35>(p: T35, n: number): T35 {return p};
function fooBDN35<T35, G35 extends T35>(p: T35, n: number): G35 {return p as G35};
function fooDBN35<G35 extends T35, T35>(p: G35, n: number): T35 { return p as T35};
function fooDDN35<G35 extends T35, T35>(p: G35, n: number): G35 { return p};
function fooBBO35<T35>(p: T35, n?: number): T35 {return p};
function fooBDO35<T35, G35 extends T35>(p: T35, n?: number): G35 {return p as G35};
function fooDBO35<G35 extends T35, T35>(p: G35, n?: number): T35 { return p as T35};
function fooDDO35<G35 extends T35, T35>(p: G35, n?: number): G35 { return p};
function fooBBR35<T35>(p: T35, ...n: number[]): T35 {return p};
function fooBDR35<T35, G35 extends T35>(p: T35, ...n: number[]): G35 {return p as G35};
function fooDBR35<G35 extends T35, T35>(p: G35, ...n: number[]): T35 { return p as T35};
function fooDDR35<G35 extends T35, T35>(p: G35, ...n: number[]): G35 { return p};
let foobb35 = fooBB35<Base35>
let foobd35 = fooBD35<Base35,Derived35>
let foodb35 = fooDB35<Derived35,Base35>
let foodd35 = fooDD35<Derived35,Derived35>
let foobbn35 = fooBBN35<Base35>
let foobdn35 = fooBDN35<Base35,Derived35>
let foodbn35 = fooDBN35<Derived35,Base35>
let fooddn35 = fooDDN35<Derived35,Derived35>
let foobbo35 = fooBBO35<Base35>
let foobdo35 = fooBDO35<Base35,Derived35>
let foodbo35 = fooDBO35<Derived35,Base35>
let fooddo35 = fooDDO35<Derived35,Derived35>
let foobbr35 = fooBBR35<Base35>
let foobdr35 = fooBDR35<Base35,Derived35>
let foodbr35 = fooDBR35<Derived35,Base35>
let fooddr35 = fooDDR35<Derived35,Derived35>
foodbr35 = foobdr35

class Base36 {}
class Derived36 extends Base36 {}
function fooBB36<T36>(p: T36): T36 {return p}
function fooBD36<T36, G36 extends T36>(p: T36): G36 {return p as G36}
function fooDB36<G36 extends T36, T36>(p: G36): T36 { return p as T36};
function fooDD36<G36 extends T36, T36>(p: G36): G36 { return p};
function fooBBN36<T36>(p: T36, n: number): T36 {return p};
function fooBDN36<T36, G36 extends T36>(p: T36, n: number): G36 {return p as G36};
function fooDBN36<G36 extends T36, T36>(p: G36, n: number): T36 { return p as T36};
function fooDDN36<G36 extends T36, T36>(p: G36, n: number): G36 { return p};
function fooBBO36<T36>(p: T36, n?: number): T36 {return p};
function fooBDO36<T36, G36 extends T36>(p: T36, n?: number): G36 {return p as G36};
function fooDBO36<G36 extends T36, T36>(p: G36, n?: number): T36 { return p as T36};
function fooDDO36<G36 extends T36, T36>(p: G36, n?: number): G36 { return p};
function fooBBR36<T36>(p: T36, ...n: number[]): T36 {return p};
function fooBDR36<T36, G36 extends T36>(p: T36, ...n: number[]): G36 {return p as G36};
function fooDBR36<G36 extends T36, T36>(p: G36, ...n: number[]): T36 { return p as T36};
function fooDDR36<G36 extends T36, T36>(p: G36, ...n: number[]): G36 { return p};
let foobb36 = fooBB36<Base36>
let foobd36 = fooBD36<Base36,Derived36>
let foodb36 = fooDB36<Derived36,Base36>
let foodd36 = fooDD36<Derived36,Derived36>
let foobbn36 = fooBBN36<Base36>
let foobdn36 = fooBDN36<Base36,Derived36>
let foodbn36 = fooDBN36<Derived36,Base36>
let fooddn36 = fooDDN36<Derived36,Derived36>
let foobbo36 = fooBBO36<Base36>
let foobdo36 = fooBDO36<Base36,Derived36>
let foodbo36 = fooDBO36<Derived36,Base36>
let fooddo36 = fooDDO36<Derived36,Derived36>
let foobbr36 = fooBBR36<Base36>
let foobdr36 = fooBDR36<Base36,Derived36>
let foodbr36 = fooDBR36<Derived36,Base36>
let fooddr36 = fooDDR36<Derived36,Derived36>
foodbn36 = foobbn36

class Base37 {}
class Derived37 extends Base37 {}
function fooBB37<T37>(p: T37): T37 {return p}
function fooBD37<T37, G37 extends T37>(p: T37): G37 {return p as G37}
function fooDB37<G37 extends T37, T37>(p: G37): T37 { return p as T37};
function fooDD37<G37 extends T37, T37>(p: G37): G37 { return p};
function fooBBN37<T37>(p: T37, n: number): T37 {return p};
function fooBDN37<T37, G37 extends T37>(p: T37, n: number): G37 {return p as G37};
function fooDBN37<G37 extends T37, T37>(p: G37, n: number): T37 { return p as T37};
function fooDDN37<G37 extends T37, T37>(p: G37, n: number): G37 { return p};
function fooBBO37<T37>(p: T37, n?: number): T37 {return p};
function fooBDO37<T37, G37 extends T37>(p: T37, n?: number): G37 {return p as G37};
function fooDBO37<G37 extends T37, T37>(p: G37, n?: number): T37 { return p as T37};
function fooDDO37<G37 extends T37, T37>(p: G37, n?: number): G37 { return p};
function fooBBR37<T37>(p: T37, ...n: number[]): T37 {return p};
function fooBDR37<T37, G37 extends T37>(p: T37, ...n: number[]): G37 {return p as G37};
function fooDBR37<G37 extends T37, T37>(p: G37, ...n: number[]): T37 { return p as T37};
function fooDDR37<G37 extends T37, T37>(p: G37, ...n: number[]): G37 { return p};
let foobb37 = fooBB37<Base37>
let foobd37 = fooBD37<Base37,Derived37>
let foodb37 = fooDB37<Derived37,Base37>
let foodd37 = fooDD37<Derived37,Derived37>
let foobbn37 = fooBBN37<Base37>
let foobdn37 = fooBDN37<Base37,Derived37>
let foodbn37 = fooDBN37<Derived37,Base37>
let fooddn37 = fooDDN37<Derived37,Derived37>
let foobbo37 = fooBBO37<Base37>
let foobdo37 = fooBDO37<Base37,Derived37>
let foodbo37 = fooDBO37<Derived37,Base37>
let fooddo37 = fooDDO37<Derived37,Derived37>
let foobbr37 = fooBBR37<Base37>
let foobdr37 = fooBDR37<Base37,Derived37>
let foodbr37 = fooDBR37<Derived37,Base37>
let fooddr37 = fooDDR37<Derived37,Derived37>
foodbo37 = foobbo37

class Base38 {}
class Derived38 extends Base38 {}
function fooBB38<T38>(p: T38): T38 { return p; }
function fooBD38<T38, G38 extends T38>(p: T38): G38 { return p as G38; }
function fooDB38<G38 extends T38, T38>(p: G38): T38 { return p as T38; }
function fooDD38<G38 extends T38, T38>(p: G38): G38 { return p; }
function fooBBN38<T38>(p: T38, n: number): T38 { return p; }
function fooBDN38<T38, G38 extends T38>(p: T38, n: number): G38 { return p as G38; }
function fooDBN38<G38 extends T38, T38>(p: G38, n: number): T38 { return p as T38; }
function fooDDN38<G38 extends T38, T38>(p: G38, n: number): G38 { return p; }
function fooBBO38<T38>(p: T38, n?: number): T38 { return p; }
function fooBDO38<T38, G38 extends T38>(p: T38, n?: number): G38 { return p as G38; }
function fooDBO38<G38 extends T38, T38>(p: G38, n?: number): T38 { return p as T38; }
function fooDDO38<G38 extends T38, T38>(p: G38, n?: number): G38 { return p; }
function fooBBR38<T38>(p: T38, ...n: number[]): T38 { return p; }
function fooBDR38<T38, G38 extends T38>(p: T38, ...n: number[]): G38 { return p as G38; }
function fooDBR38<G38 extends T38, T38>(p: G38, ...n: number[]): T38 { return p as T38; }
function fooDDR38<G38 extends T38, T38>(p: G38, ...n: number[]): G38 { return p; }

let foobb38 = fooBB38<Base38>;
let foobd38 = fooBD38<Base38, Derived38>;
let foodb38 = fooDB38<Derived38, Base38>;
let foodd38 = fooDD38<Derived38, Derived38>;
let foobbn38 = fooBBN38<Base38>;
let foobdn38 = fooBDN38<Base38, Derived38>;
let foodbn38 = fooDBN38<Derived38, Base38>;
let fooddn38 = fooDDN38<Derived38, Derived38>;
let foobbo38 = fooBBO38<Base38>;
let foobdo38 = fooBDO38<Base38, Derived38>;
let foodbo38 = fooDBO38<Derived38, Base38>;
let fooddo38 = fooDDO38<Derived38, Derived38>;
let foobbr38 = fooBBR38<Base38>;
let foobdr38 = fooBDR38<Base38, Derived38>;
let foodbr38 = fooDBR38<Derived38, Base38>;
let fooddr38 = fooDDR38<Derived38, Derived38>;

class Base39 {
  b: string = 'b'
}
class Derived39 extends Base39 {
  b: string = 'd'
}
class C39 {
  fooBB39(p: Base39): Base39 {return p};
  fooBD39(p: Base39): Derived39 {return new Derived39()};
  fooDB39(p: Derived39): Base39 { return new Base39()};
  fooDD39(p: Derived39): Derived39 { return p};
  fooBBN39(p: Base39, n: number): Base39 {return p};
  fooBDN39(p: Base39, n: number): Derived39 {return new Derived39()};
  fooDBN39(p: Derived39, n: number): Base39 { return new Base39()};
  fooDDN39(p: Derived39, n: number): Derived39 { return p};
  fooBBO39(p: Base39, n?: number): Base39 {return p};
  fooBDO39(p: Base39, n?: number): Derived39 {return new Derived39()};
  fooDBO39(p: Derived39, n?: number): Base39 { return new Base39()};
  fooDDO39(p: Derived39, n?: number): Derived39 { return p};
  fooBBR39(p: Base39, ...n: number[]): Base39 {return p};
  fooBDR39(p: Base39, ...n: number[]): Derived39 {return new Derived39()};
  fooDBR39(p: Derived39, ...n: number[]): Base39 { return new Base39()};
  fooDDR39(p: Derived39, ...n: number[]): Derived39 { return p};
}
const c39: C39 = new C39()
let foobb39 = c39.fooBB39
let foobd39 = c39.fooBD39
let foodb39 = c39.fooDB39
let foodd39 = c39.fooDD39
let foobbn39 = c39.fooBBN39
let foobdn39 = c39.fooBDN39
let foodbn39 = c39.fooDBN39
let fooddn39 = c39.fooDDN39
let foobbo39 = c39.fooBBO39
let foobdo39 = c39.fooBDO39
let foodbo39 = c39.fooDBO39
let fooddo39 = c39.fooDDO39
let foobbr39 = c39.fooBBR39
let foobdr39 = c39.fooBDR39
let foodbr39 = c39.fooDBR39
let fooddr39 = c39.fooDDR39
foobb39 = foobd39 // OK: identical parameter types, and covariant return type

class Base40 {
  b: string = 'b'
}
class Derived40 extends Base40 {
  b: string = 'd'
}
class C40 {
  fooBB40(p: Base40): Base40 {return p};
  fooBD40(p: Base40): Derived40 {return new Derived40()};
  fooDB40(p: Derived40): Base40 { return new Base40()};
  fooDD40(p: Derived40): Derived40 { return p};
  fooBBN40(p: Base40, n: number): Base40 {return p};
  fooBDN40(p: Base40, n: number): Derived40 {return new Derived40()};
  fooDBN40(p: Derived40, n: number): Base40 { return new Base40()};
  fooDDN40(p: Derived40, n: number): Derived40 { return p};
  fooBBO40(p: Base40, n?: number): Base40 {return p};
  fooBDO40(p: Base40, n?: number): Derived40 {return new Derived40()};
  fooDBO40(p: Derived40, n?: number): Base40 { return new Base40()};
  fooDDO40(p: Derived40, n?: number): Derived40 { return p};
  fooBBR40(p: Base40, ...n: number[]): Base40 {return p};
  fooBDR40(p: Base40, ...n: number[]): Derived40 {return new Derived40()};
  fooDBR40(p: Derived40, ...n: number[]): Base40 { return new Base40()};
  fooDDR40(p: Derived40, ...n: number[]): Derived40 { return p};
}
const c40: C40 = new C40()
let foobb40 = c40.fooBB40
let foobd40 = c40.fooBD40
let foodb40 = c40.fooDB40
let foodd40 = c40.fooDD40
let foobbn40 = c40.fooBBN40
let foobdn40 = c40.fooBDN40
let foodbn40 = c40.fooDBN40
let fooddn40 = c40.fooDDN40
let foobbo40 = c40.fooBBO40
let foobdo40 = c40.fooBDO40
let foodbo40 = c40.fooDBO40
let fooddo40 = c40.fooDDO40
let foobbr40 = c40.fooBBR40
let foobdr40 = c40.fooBDR40
let foodbr40 = c40.fooDBR40
let fooddr40 = c40.fooDDR40
foodb40 = foobd40 // OK: identical parameter types, and covariant return type

class Base41 {
  b: string = 'b'
}
class Derived41 extends Base41 {
  b: string = 'd'
}
class C41 {
  fooBB41(p: Base41): Base41 {return p};
  fooBD41(p: Base41): Derived41 {return new Derived41()};
  fooDB41(p: Derived41): Base41 { return new Base41()};
  fooDD41(p: Derived41): Derived41 { return p};
  fooBBN41(p: Base41, n: number): Base41 {return p};
  fooBDN41(p: Base41, n: number): Derived41 {return new Derived41()};
  fooDBN41(p: Derived41, n: number): Base41 { return new Base41()};
  fooDDN41(p: Derived41, n: number): Derived41 { return p};
  fooBBO41(p: Base41, n?: number): Base41 {return p};
  fooBDO41(p: Base41, n?: number): Derived41 {return new Derived41()};
  fooDBO41(p: Derived41, n?: number): Base41 { return new Base41()};
  fooDDO41(p: Derived41, n?: number): Derived41 { return p};
  fooBBR41(p: Base41, ...n: number[]): Base41 {return p};
  fooBDR41(p: Base41, ...n: number[]): Derived41 {return new Derived41()};
  fooDBR41(p: Derived41, ...n: number[]): Base41 { return new Base41()};
  fooDDR41(p: Derived41, ...n: number[]): Derived41 { return p};
}
const c41: C41 = new C41()
let foobb41 = c41.fooBB41
let foobd41 = c41.fooBD41
let foodb41 = c41.fooDB41
let foodd41 = c41.fooDD41
let foobbn41 = c41.fooBBN41
let foobdn41 = c41.fooBDN41
let foodbn41 = c41.fooDBN41
let fooddn41 = c41.fooDDN41
let foobbo41 = c41.fooBBO41
let foobdo41 = c41.fooBDO41
let foodbo41 = c41.fooDBO41
let fooddo41 = c41.fooDDO41
let foobbr41 = c41.fooBBR41
let foobdr41 = c41.fooBDR41
let foodbr41 = c41.fooDBR41
let fooddr41 = c41.fooDDR41
foodb41 = foodd41

class Base42 {
  b: string = 'b'
}
class Derived42 extends Base42 {
  b: string = 'd'
}
class C42 {
  fooBB42(p: Base42): Base42 {return p};
  fooBD42(p: Base42): Derived42 {return new Derived42()};
  fooDB42(p: Derived42): Base42 { return new Base42()};
  fooDD42(p: Derived42): Derived42 { return p};
  fooBBN42(p: Base42, n: number): Base42 {return p};
  fooBDN42(p: Base42, n: number): Derived42 {return new Derived42()};
  fooDBN42(p: Derived42, n: number): Base42 { return new Base42()};
  fooDDN42(p: Derived42, n: number): Derived42 { return p};
  fooBBO42(p: Base42, n?: number): Base42 {return p};
  fooBDO42(p: Base42, n?: number): Derived42 {return new Derived42()};
  fooDBO42(p: Derived42, n?: number): Base42 { return new Base42()};
  fooDDO42(p: Derived42, n?: number): Derived42 { return p};
  fooBBR42(p: Base42, ...n: number[]): Base42 {return p};
  fooBDR42(p: Base42, ...n: number[]): Derived42 {return new Derived42()};
  fooDBR42(p: Derived42, ...n: number[]): Base42 { return new Base42()};
  fooDDR42(p: Derived42, ...n: number[]): Derived42 { return p};
}
const c42: C42 = new C42()
let foobb42 = c42.fooBB42
let foobd42 = c42.fooBD42
let foodb42 = c42.fooDB42
let foodd42 = c42.fooDD42
let foobbn42 = c42.fooBBN42
let foobdn42 = c42.fooBDN42
let foodbn42 = c42.fooDBN42
let fooddn42 = c42.fooDDN42
let foobbo42 = c42.fooBBO42
let foobdo42 = c42.fooBDO42
let foodbo42 = c42.fooDBO42
let fooddo42 = c42.fooDDO42
let foobbr42 = c42.fooBBR42
let foobdr42 = c42.fooBDR42
let foodbr42 = c42.fooDBR42
let fooddr42 = c42.fooDDR42
foodd42 = foobd42

class Base43 {
  b: string = 'b'
}
class Derived43 extends Base43 {
  b: string = 'd'
}
class C43 {
  fooBB43(p: Base43): Base43 {return p};
  fooBD43(p: Base43): Derived43 {return new Derived43()};
  fooDB43(p: Derived43): Base43 { return new Base43()};
  fooDD43(p: Derived43): Derived43 { return p};
  fooBBN43(p: Base43, n: number): Base43 {return p};
  fooBDN43(p: Base43, n: number): Derived43 {return new Derived43()};
  fooDBN43(p: Derived43, n: number): Base43 { return new Base43()};
  fooDDN43(p: Derived43, n: number): Derived43 { return p};
  fooBBO43(p: Base43, n?: number): Base43 {return p};
  fooBDO43(p: Base43, n?: number): Derived43 {return new Derived43()};
  fooDBO43(p: Derived43, n?: number): Base43 { return new Base43()};
  fooDDO43(p: Derived43, n?: number): Derived43 { return p};
  fooBBR43(p: Base43, ...n: number[]): Base43 {return p};
  fooBDR43(p: Base43, ...n: number[]): Derived43 {return new Derived43()};
  fooDBR43(p: Derived43, ...n: number[]): Base43 { return new Base43()};
  fooDDR43(p: Derived43, ...n: number[]): Derived43 { return p};
}
const c43: C43 = new C43()
let foobb43 = c43.fooBB43
let foobd43 = c43.fooBD43
let foodb43 = c43.fooDB43
let foodd43 = c43.fooDD43
let foobbn43 = c43.fooBBN43
let foobdn43 = c43.fooBDN43
let foodbn43 = c43.fooDBN43
let fooddn43 = c43.fooDDN43
let foobbo43 = c43.fooBBO43
let foobdo43 = c43.fooBDO43
let foodbo43 = c43.fooDBO43
let fooddo43 = c43.fooDDO43
let foobbr43 = c43.fooBBR43
let foobdr43 = c43.fooBDR43
let foodbr43 = c43.fooDBR43
let fooddr43 = c43.fooDDR43
foobbn43 = foobb43

class Base44 {
  b: string = 'b'
}
class Derived44 extends Base44 {
  b: string = 'd'
}
class C44 {
  fooBB44(p: Base44): Base44 {return p};
  fooBD44(p: Base44): Derived44 {return new Derived44()};
  fooDB44(p: Derived44): Base44 { return new Base44()};
  fooDD44(p: Derived44): Derived44 { return p};
  fooBBN44(p: Base44, n: number): Base44 {return p};
  fooBDN44(p: Base44, n: number): Derived44 {return new Derived44()};
  fooDBN44(p: Derived44, n: number): Base44 { return new Base44()};
  fooDDN44(p: Derived44, n: number): Derived44 { return p};
  fooBBO44(p: Base44, n?: number): Base44 {return p};
  fooBDO44(p: Base44, n?: number): Derived44 {return new Derived44()};
  fooDBO44(p: Derived44, n?: number): Base44 { return new Base44()};
  fooDDO44(p: Derived44, n?: number): Derived44 { return p};
  fooBBR44(p: Base44, ...n: number[]): Base44 {return p};
  fooBDR44(p: Base44, ...n: number[]): Derived44 {return new Derived44()};
  fooDBR44(p: Derived44, ...n: number[]): Base44 { return new Base44()};
  fooDDR44(p: Derived44, ...n: number[]): Derived44 { return p};
}
const c44: C44 = new C44()
let foobb44 = c44.fooBB44
let foobd44 = c44.fooBD44
let foodb44 = c44.fooDB44
let foodd44 = c44.fooDD44
let foobbn44 = c44.fooBBN44
let foobdn44 = c44.fooBDN44
let foodbn44 = c44.fooDBN44
let fooddn44 = c44.fooDDN44
let foobbo44 = c44.fooBBO44
let foobdo44 = c44.fooBDO44
let foodbo44 = c44.fooDBO44
let fooddo44 = c44.fooDDO44
let foobbr44 = c44.fooBBR44
let foobdr44 = c44.fooBDR44
let foodbr44 = c44.fooDBR44
let fooddr44 = c44.fooDDR44
foobbo44 = foobb44

export default function SubtypingForFunctionTypesTest01(): void {
  describe('SubtypingForFunctionTypesTest01', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0100
     * @tc.name      testPositiveFunctionGeneric0023
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foodd23(new Derived23) instanceof Base23).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0200
     * @tc.name      testPositiveFunctionGeneric0024
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foobbn24(new Base24, 1) instanceof Base24).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0300
     * @tc.name      testPositiveFunctionGeneric0025
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foobbo25(new Base25) instanceof Base25).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0400
     * @tc.name      testPositiveFunctionGeneric0026
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foobbn26(new Derived26, 1) instanceof Base26).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0500
     * @tc.name      testPositiveFunctionGeneric0027
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foobbo27(new Derived27) instanceof Base27).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0600
     * @tc.name      testPositiveFunctionGeneric0028
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foodbn28(new Derived28, 1) instanceof Base28).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0700
     * @tc.name      testPositiveFunctionGeneric0029
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foodbo29(new Derived29) instanceof Base29).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0800
     * @tc.name      testPositiveFunctionGeneric0030
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foodbn30(new Derived30, 1) instanceof Derived30).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0900
     * @tc.name      testPositiveFunctionGeneric0031
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foodbo31(new Derived31) instanceof Derived31).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1000
     * @tc.name      testPositiveFunctionGeneric0032
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foodbr32(new Derived32, 1, 2, 3) instanceof Derived32).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1100
     * @tc.name      testPositiveFunctionGeneric0033
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foodbn33(new Derived33, 1) instanceof Base33).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1200
     * @tc.name      testPositiveFunctionGeneric0034
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foodbo34(new Derived34) instanceof Base34).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1300
     * @tc.name      testPositiveFunctionGeneric0035
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foodbr35(new Derived35, 1, 2, 3) instanceof Base35).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_TEST_1400
     * @tc.name      testPositiveFunctionGeneric0036
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r = foodbn36.unsafeCall(new Base36, 1.0)
      expect(r instanceof Base36).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1500
     * @tc.name      testPositiveFunctionGeneric0037
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r = foodbo37.unsafeCall(new Base37)
      expect(r instanceof Base37).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1600
     * @tc.name      testPositiveFunctionGeneric0038
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      foodbr38 = foobbr38;
      let r = foodbr38.unsafeCall(new Derived38(), 1.0, 2.0, 3.0);
      expect(r instanceof Base38).assertTrue();
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1700
     * @tc.name      testPositiveInstanceMethod0039
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foobb39(new Base39) instanceof Derived39).assertTrue()
      expect(foobb39(new Base39).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1800
     * @tc.name      testPositiveInstanceMethod0040
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r = foodb40.unsafeCall(new Base40)
      expect(r instanceof Derived40).assertTrue()
      expect((r as Base40).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1900
     * @tc.name      testPositiveInstanceMethod0041
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foodb41(new Derived41) instanceof Derived41).assertTrue()
      expect(foodb41(new Derived41).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_2000
     * @tc.name      testPositiveInstanceMethod0042
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r = foodd42.unsafeCall(new Base42)
      expect(r instanceof Derived42).assertTrue()
      expect((r as Base42).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_2100
     * @tc.name      testPositiveInstanceMethod0043
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foobbn43(new Base43, 1) instanceof Base43).assertTrue()
      expect(foobbn43(new Base43, 1).b).assertEqual('b')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_2200
     * @tc.name      testPositiveInstanceMethod0044
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foobbo44(new Base44) instanceof Base44).assertTrue()
      expect(foobbo44(new Base44).b).assertEqual('b')
    });
  })
}
