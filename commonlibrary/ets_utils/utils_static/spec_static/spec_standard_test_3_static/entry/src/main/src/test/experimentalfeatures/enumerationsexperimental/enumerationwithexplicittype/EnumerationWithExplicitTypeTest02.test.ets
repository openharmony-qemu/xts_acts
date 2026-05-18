/*
* Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

enum Enum12: int {
  Red,
  Green = 10,
  Blue,
  First = -2147483648,
  Second = 12345,
  Third = 2147483647,
  One = 1,
  one = 1,
  oNe = 1
}

enum Enum13: long {
  Red,
  Green = 10,
  Blue,
  First = -9223372036854775808,
  Second = 12345,
  Third = 9223372036854775807,
  One = 1,
  one = 1,
  oNe = 1
}

enum Enum14: byte {
  Red,
  Green = 10,
  Blue,
  First = -128,
  Second = 123,
  Third = 127,
  One = 1,
  one = 1,
  oNe = 1
}

enum Enum15: short {
  Red,
  Green = 10,
  Blue,
  First = -32768,
  Second = 12345,
  Third = 32767,
  One = 1,
  one = 1,
  oNe = 1
}

enum Enum16: double {
  Red = 1.5,
  Green = 10.3,
  Blue = 7.6,
  First = -214748.3648,
  Second = 123.45,
  Third = 2147483.647,
  One = 1.0,
  one = 1.0,
  oNe = 1.0
}

enum Enum17: float {
  Red = 1.5f,
  Green = 10.3f,
  Blue = 7.6f,
  First = -214748.3648f,
  Second = 123.45f,
  Third = 2147483.647f,
  One = 1.0f,
  one = 1.0f,
  oNe = 1.0f
}


namespace testNS10 {
  enum Enum: int {
    Red, Green = 10, Blue,
    First = -2147483648, Second = 12345, Third = 2147483647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.Red]).assertEqual("Red")
    expect(Enum.Green.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.Green]).assertEqual("Green")
    expect(Enum.Blue.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.Blue]).assertEqual("Blue")
    expect(Enum.First.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.First]).assertEqual("First")
    expect(Enum.Second.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.Second]).assertEqual("Second")
    expect(Enum.Third.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.Third]).assertEqual("Third")
    expect(Enum.One.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.One]).assertEqual("One")
    expect(Enum.one.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.one]).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.oNe]).assertEqual("oNe")
    return true
  }
}

namespace testNS11 {
  enum Enum: int {
    Red, Green = 10, Blue,
    First = -2147483648, Second = 12345, Third = 2147483647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.Red]).assertEqual("Red")
    expect(Enum.Green.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.Green]).assertEqual("Green")
    expect(Enum.Blue.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.Blue]).assertEqual("Blue")
    expect(Enum.First.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.First]).assertEqual("First")
    expect(Enum.Second.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.Second]).assertEqual("Second")
    expect(Enum.Third.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.Third]).assertEqual("Third")
    expect(Enum.One.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.One]).assertEqual("One")
    expect(Enum.one.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.one]).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof int).assertEqual(true)
    expect(Enum[Enum.oNe]).assertEqual("oNe")
    return true
  }
}

namespace testNS12 {
  enum Enum: int {
    Red, Green = 10, Blue,
    First = -2147483648, Second = 12345, Third = 2147483647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("Red")
    c = Enum.Green
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("Green")
    c = Enum.Blue
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("Blue")
    c = Enum.First
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("First")
    c = Enum.Second
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("Second")
    c = Enum.Third
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("Third")
    c = Enum.One
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("One")
    c = Enum.one
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("oNe")
    return true
  }
}

namespace testNS13 {
  enum Enum: int {
    Red, Green = 10, Blue,
    First = -2147483648, Second = 12345, Third = 2147483647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("Red")
    c = Enum.Green
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("Green")
    c = Enum.Blue
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("Blue")
    c = Enum.First
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("First")
    c = Enum.Second
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("Second")
    c = Enum.Third
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("Third")
    c = Enum.One
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("One")
    c = Enum.one
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(Enum[c]).assertEqual("oNe")
    return true
  }
}

namespace testNS14 {
  enum Enum: long {
    Red, Green = 10, Blue,
    First = -9223372036854775808, Second = 12345, Third = 9223372036854775807,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.Red]).assertEqual("Red")
    expect(Enum.Green.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.Green]).assertEqual("Green")
    expect(Enum.Blue.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.Blue]).assertEqual("Blue")
    expect(Enum.First.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.First]).assertEqual("First")
    expect(Enum.Second.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.Second]).assertEqual("Second")
    expect(Enum.Third.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.Third]).assertEqual("Third")
    expect(Enum.One.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.One]).assertEqual("One")
    expect(Enum.one.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.one]).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.oNe]).assertEqual("oNe")
    return true
  }
}

namespace testNS15 {
  enum Enum: long {
    Red, Green = 10, Blue,
    First = -9223372036854775808, Second = 12345, Third = 9223372036854775807,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.Red]).assertEqual("Red")
    expect(Enum.Green.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.Green]).assertEqual("Green")
    expect(Enum.Blue.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.Blue]).assertEqual("Blue")
    expect(Enum.First.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.First]).assertEqual("First")
    expect(Enum.Second.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.Second]).assertEqual("Second")
    expect(Enum.Third.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.Third]).assertEqual("Third")
    expect(Enum.One.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.One]).assertEqual("One")
    expect(Enum.one.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.one]).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof long).assertEqual(true)
    expect(Enum[Enum.oNe]).assertEqual("oNe")
    return true
  }
}

namespace testNS16 {
  enum Enum: long {
    Red, Green = 10, Blue,
    First = -9223372036854775808, Second = 12345, Third = 9223372036854775807,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("Red")
    c = Enum.Green
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("Green")
    c = Enum.Blue
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("Blue")
    c = Enum.First
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("First")
    c = Enum.Second
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("Second")
    c = Enum.Third
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("Third")
    c = Enum.One
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("One")
    c = Enum.one
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("oNe")
    return true
  }
}

namespace testNS17 {
  enum Enum: long {
    Red, Green = 10, Blue,
    First = -9223372036854775808, Second = 12345, Third = 9223372036854775807,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("Red")
    c = Enum.Green
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("Green")
    c = Enum.Blue
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("Blue")
    c = Enum.First
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("First")
    c = Enum.Second
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("Second")
    c = Enum.Third
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("Third")
    c = Enum.One
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("One")
    c = Enum.one
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(Enum[c]).assertEqual("oNe")
    return true
  }
}

namespace testNS18 {
  enum Enum: byte {
    Red, Green = 10, Blue,
    First = -128, Second = 123, Third = 127,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.Red]).assertEqual("Red")
    expect(Enum.Green.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.Green]).assertEqual("Green")
    expect(Enum.Blue.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.Blue]).assertEqual("Blue")
    expect(Enum.First.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.First]).assertEqual("First")
    expect(Enum.Second.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.Second]).assertEqual("Second")
    expect(Enum.Third.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.Third]).assertEqual("Third")
    expect(Enum.One.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.One]).assertEqual("One")
    expect(Enum.one.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.one]).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.oNe]).assertEqual("oNe")
    return true
  }
}

namespace testNS19 {
  enum Enum: byte {
    Red, Green = 10, Blue,
    First = -128, Second = 123, Third = 127,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.Red]).assertEqual("Red")
    expect(Enum.Green.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.Green]).assertEqual("Green")
    expect(Enum.Blue.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.Blue]).assertEqual("Blue")
    expect(Enum.First.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.First]).assertEqual("First")
    expect(Enum.Second.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.Second]).assertEqual("Second")
    expect(Enum.Third.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.Third]).assertEqual("Third")
    expect(Enum.One.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.One]).assertEqual("One")
    expect(Enum.one.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.one]).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[Enum.oNe]).assertEqual("oNe")
    return true
  }
}

namespace testNS20 {
  enum Enum: byte {
    Red, Green = 10, Blue,
    First = -128, Second = 123, Third = 127,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("Red")
    c = Enum.Green
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("Green")
    c = Enum.Blue
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("Blue")
    c = Enum.First
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("First")
    c = Enum.Second
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("Second")
    c = Enum.Third
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("Third")
    c = Enum.One
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("One")
    c = Enum.one
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("oNe")
    return true
  }
}

namespace testNS21 {
  enum Enum: byte {
    Red, Green = 10, Blue,
    First = -128, Second = 123, Third = 127,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("Red")
    c = Enum.Green
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("Green")
    c = Enum.Blue
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("Blue")
    c = Enum.First
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("First")
    c = Enum.Second
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("Second")
    c = Enum.Third
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("Third")
    c = Enum.One
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("One")
    c = Enum.one
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(Enum[c]).assertEqual("oNe")
    return true
  }
}

namespace testNS22 {
  enum Enum: short {
    Red, Green = 10, Blue,
    First = -32768, Second = 12345, Third = 32767,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.Red]).assertEqual("Red")
    expect(Enum.Green.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.Green]).assertEqual("Green")
    expect(Enum.Blue.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.Blue]).assertEqual("Blue")
    expect(Enum.First.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.First]).assertEqual("First")
    expect(Enum.Second.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.Second]).assertEqual("Second")
    expect(Enum.Third.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.Third]).assertEqual("Third")
    expect(Enum.One.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.One]).assertEqual("One")
    expect(Enum.one.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.one]).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.oNe]).assertEqual("oNe")
    return true
  }
}

namespace testNS23 {
  enum Enum: short {
    Red, Green = 10, Blue,
    First = -32768, Second = 12345, Third = 32767,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.Red]).assertEqual("Red")
    expect(Enum.Green.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.Green]).assertEqual("Green")
    expect(Enum.Blue.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.Blue]).assertEqual("Blue")
    expect(Enum.First.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.First]).assertEqual("First")
    expect(Enum.Second.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.Second]).assertEqual("Second")
    expect(Enum.Third.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.Third]).assertEqual("Third")
    expect(Enum.One.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.One]).assertEqual("One")
    expect(Enum.one.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.one]).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof short).assertEqual(true)
    expect(Enum[Enum.oNe]).assertEqual("oNe")
    return true
  }
}

namespace testNS24 {
  enum Enum: short {
    Red, Green = 10, Blue,
    First = -32768, Second = 12345, Third = 32767,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("Red")
    c = Enum.Green
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("Green")
    c = Enum.Blue
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("Blue")
    c = Enum.First
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("First")
    c = Enum.Second
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("Second")
    c = Enum.Third
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("Third")
    c = Enum.One
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("One")
    c = Enum.one
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("oNe")
    return true
  }
}

namespace testNS25 {
  enum Enum: short {
    Red, Green = 10, Blue,
    First = -32768, Second = 12345, Third = 32767,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("Red")
    c = Enum.Green
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("Green")
    c = Enum.Blue
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("Blue")
    c = Enum.First
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("First")
    c = Enum.Second
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("Second")
    c = Enum.Third
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("Third")
    c = Enum.One
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("One")
    c = Enum.one
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(Enum[c]).assertEqual("oNe")
    return true
  }
}

namespace testNS26 {
  enum Enum: double {
    Red = 1.5, Green = 10.3, Blue = 7.6,
    First = -214748.3648, Second = 123.45, Third = 2147483.647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.Red]).assertEqual("Red")
    expect(Enum.Green.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.Green]).assertEqual("Green")
    expect(Enum.Blue.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.Blue]).assertEqual("Blue")
    expect(Enum.First.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.First]).assertEqual("First")
    expect(Enum.Second.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.Second]).assertEqual("Second")
    expect(Enum.Third.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.Third]).assertEqual("Third")
    expect(Enum.One.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.One]).assertEqual("One")
    expect(Enum.one.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.one]).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.oNe]).assertEqual("oNe")
    return true
  }
}

namespace testNS27 {
  enum Enum: double {
    Red = 1.5, Green = 10.3, Blue = 7.6,
    First = -214748.3648, Second = 123.45, Third = 2147483.647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.Red]).assertEqual("Red")
    expect(Enum.Green.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.Green]).assertEqual("Green")
    expect(Enum.Blue.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.Blue]).assertEqual("Blue")
    expect(Enum.First.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.First]).assertEqual("First")
    expect(Enum.Second.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.Second]).assertEqual("Second")
    expect(Enum.Third.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.Third]).assertEqual("Third")
    expect(Enum.One.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.One]).assertEqual("One")
    expect(Enum.one.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.one]).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof double).assertEqual(true)
    expect(Enum[Enum.oNe]).assertEqual("oNe")
    return true
  }
}

namespace testNS28 {
  enum Enum: double {
    Red = 1.5, Green = 10.3, Blue = 7.6,
    First = -214748.3648, Second = 123.45, Third = 2147483.647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("Red")
    c = Enum.Green
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("Green")
    c = Enum.Blue
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("Blue")
    c = Enum.First
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("First")
    c = Enum.Second
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("Second")
    c = Enum.Third
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("Third")
    c = Enum.One
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("One")
    c = Enum.one
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("oNe")
    return true
  }
}

namespace testNS29 {
  enum Enum: double {
    Red = 1.5, Green = 10.3, Blue = 7.6,
    First = -214748.3648, Second = 123.45, Third = 2147483.647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("Red")
    c = Enum.Green
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("Green")
    c = Enum.Blue
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("Blue")
    c = Enum.First
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("First")
    c = Enum.Second
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("Second")
    c = Enum.Third
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("Third")
    c = Enum.One
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("One")
    c = Enum.one
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(Enum[c]).assertEqual("oNe")
    return true
  }
}

namespace testNS30 {
  enum Enum: float {
    Red = 1.5f, Green = 10.3f, Blue = 7.6f,
    First = -214748.3648f, Second = 123.45f, Third = 2147483.647f,
    One = 1.0f, one = 1.0f, oNe = 1.0f
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.Red]).assertEqual("Red")
    expect(Enum.Green.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.Green]).assertEqual("Green")
    expect(Enum.Blue.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.Blue]).assertEqual("Blue")
    expect(Enum.First.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.First]).assertEqual("First")
    expect(Enum.Second.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.Second]).assertEqual("Second")
    expect(Enum.Third.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.Third]).assertEqual("Third")
    expect(Enum.One.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.One]).assertEqual("One")
    expect(Enum.one.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.one]).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.oNe]).assertEqual("oNe")
    return true
  }
}

namespace testNS31 {
  enum Enum: float {
    Red = 1.5f, Green = 10.3f, Blue = 7.6f,
    First = -214748.3648f, Second = 123.45f, Third = 2147483.647f,
    One = 1.0f, one = 1.0f, oNe = 1.0f
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.Red]).assertEqual("Red")
    expect(Enum.Green.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.Green]).assertEqual("Green")
    expect(Enum.Blue.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.Blue]).assertEqual("Blue")
    expect(Enum.First.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.First]).assertEqual("First")
    expect(Enum.Second.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.Second]).assertEqual("Second")
    expect(Enum.Third.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.Third]).assertEqual("Third")
    expect(Enum.One.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.One]).assertEqual("One")
    expect(Enum.one.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.one]).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof float).assertEqual(true)
    expect(Enum[Enum.oNe]).assertEqual("oNe")
    return true
  }
}

namespace testNS32 {
  enum Enum: float {
    Red = 1.5f, Green = 10.3f, Blue = 7.6f,
    First = -214748.3648f, Second = 123.45f, Third = 2147483.647f,
    One = 1.0f, one = 1.0f, oNe = 1.0f
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("Red")
    c = Enum.Green
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("Green")
    c = Enum.Blue
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("Blue")
    c = Enum.First
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("First")
    c = Enum.Second
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("Second")
    c = Enum.Third
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("Third")
    c = Enum.One
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("One")
    c = Enum.one
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("oNe")
    return true
  }
}

namespace testNS33 {
  enum Enum: float {
    Red = 1.5f, Green = 10.3f, Blue = 7.6f,
    First = -214748.3648f, Second = 123.45f, Third = 2147483.647f,
    One = 1.0f, one = 1.0f, oNe = 1.0f
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("Red")
    c = Enum.Green
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("Green")
    c = Enum.Blue
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("Blue")
    c = Enum.First
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("First")
    c = Enum.Second
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("Second")
    c = Enum.Third
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("Third")
    c = Enum.One
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("One")
    c = Enum.one
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(Enum[c]).assertEqual("oNe")
    return true
  }
}



export default function EnumerationWithExplicitTypeTest02(): void {
  describe('EnumerationWithExplicitTypeTest02', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_0100
     * @tc.name      testEnumerationWithExplicitType0029
     * @tc.desc      Checking for enum with explicit int type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum12.Red.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.Red]).assertEqual("Red");
      expect(Enum12.Green.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.Green]).assertEqual("Green");
      expect(Enum12.Blue.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.Blue]).assertEqual("Blue");
      expect(Enum12.First.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.First]).assertEqual("First");
      expect(Enum12.Second.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.Second]).assertEqual("Second");
      expect(Enum12.Third.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.Third]).assertEqual("Third");
      expect(Enum12.One.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.One]).assertEqual("One");
      expect(Enum12.one.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.one]).assertEqual("one");
      expect(Enum12.oNe.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.oNe]).assertEqual("oNe");
      expect(testNS10.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_0200
     * @tc.name      testEnumerationWithExplicitType0030
     * @tc.desc      Checking for enum with explicit int type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum12.Red.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.Red]).assertEqual("Red");
      expect(Enum12.Green.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.Green]).assertEqual("Green");
      expect(Enum12.Blue.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.Blue]).assertEqual("Blue");
      expect(Enum12.First.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.First]).assertEqual("First");
      expect(Enum12.Second.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.Second]).assertEqual("Second");
      expect(Enum12.Third.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.Third]).assertEqual("Third");
      expect(Enum12.One.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.One]).assertEqual("One");
      expect(Enum12.one.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.one]).assertEqual("one");
      expect(Enum12.oNe.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[Enum12.oNe]).assertEqual("oNe");
      expect(testNS11.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_0300
     * @tc.name      testEnumerationWithExplicitType0031
     * @tc.desc      Checking for enum with explicit int type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum12 = Enum12.Red;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("Red");
      c = Enum12.Green;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("Green");
      c = Enum12.Blue;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("Blue");
      c = Enum12.First;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("First");
      c = Enum12.Second;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("Second");
      c = Enum12.Third;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("Third");
      c = Enum12.One;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("One");
      c = Enum12.one;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("one");
      c = Enum12.oNe;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("oNe");
      expect(testNS12.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_0400
     * @tc.name      testEnumerationWithExplicitType0032
     * @tc.desc      Checking for enum with explicit int type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum12 = Enum12.Red;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("Red");
      c = Enum12.Green;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("Green");
      c = Enum12.Blue;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("Blue");
      c = Enum12.First;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("First");
      c = Enum12.Second;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("Second");
      c = Enum12.Third;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("Third");
      c = Enum12.One;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("One");
      c = Enum12.one;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("one");
      c = Enum12.oNe;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(Enum12[c]).assertEqual("oNe");
      expect(testNS13.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_0500
     * @tc.name      testEnumerationWithExplicitType0033
     * @tc.desc      Checking for enum with explicit long type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum13.Red.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.Red]).assertEqual("Red");
      expect(Enum13.Green.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.Green]).assertEqual("Green");
      expect(Enum13.Blue.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.Blue]).assertEqual("Blue");
      expect(Enum13.First.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.First]).assertEqual("First");
      expect(Enum13.Second.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.Second]).assertEqual("Second");
      expect(Enum13.Third.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.Third]).assertEqual("Third");
      expect(Enum13.One.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.One]).assertEqual("One");
      expect(Enum13.one.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.one]).assertEqual("one");
      expect(Enum13.oNe.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.oNe]).assertEqual("oNe");
      expect(testNS14.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_0600
     * @tc.name      testEnumerationWithExplicitType0034
     * @tc.desc      Checking for enum with explicit long type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum13.Red.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.Red]).assertEqual("Red");
      expect(Enum13.Green.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.Green]).assertEqual("Green");
      expect(Enum13.Blue.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.Blue]).assertEqual("Blue");
      expect(Enum13.First.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.First]).assertEqual("First");
      expect(Enum13.Second.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.Second]).assertEqual("Second");
      expect(Enum13.Third.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.Third]).assertEqual("Third");
      expect(Enum13.One.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.One]).assertEqual("One");
      expect(Enum13.one.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.one]).assertEqual("one");
      expect(Enum13.oNe.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[Enum13.oNe]).assertEqual("oNe");
      expect(testNS15.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_0700
     * @tc.name      testEnumerationWithExplicitType0035
     * @tc.desc      Checking for enum with explicit long type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum13 = Enum13.Red;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("Red");
      c = Enum13.Green;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("Green");
      c = Enum13.Blue;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("Blue");
      c = Enum13.First;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("First");
      c = Enum13.Second;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("Second");
      c = Enum13.Third;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("Third");
      c = Enum13.One;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("One");
      c = Enum13.one;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("one");
      c = Enum13.oNe;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("oNe");
      expect(testNS16.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_0800
     * @tc.name      testEnumerationWithExplicitType0036
     * @tc.desc      Checking for enum with explicit long type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum13 = Enum13.Red;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("Red");
      c = Enum13.Green;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("Green");
      c = Enum13.Blue;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("Blue");
      c = Enum13.First;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("First");
      c = Enum13.Second;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("Second");
      c = Enum13.Third;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("Third");
      c = Enum13.One;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("One");
      c = Enum13.one;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("one");
      c = Enum13.oNe;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(Enum13[c]).assertEqual("oNe");
      expect(testNS17.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_0900
     * @tc.name      testEnumerationWithExplicitType0037
     * @tc.desc      Checking for enum with explicit byte type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum14.Red.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.Red]).assertEqual("Red");
      expect(Enum14.Green.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.Green]).assertEqual("Green");
      expect(Enum14.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.Blue]).assertEqual("Blue");
      expect(Enum14.First.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.First]).assertEqual("First");
      expect(Enum14.Second.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.Second]).assertEqual("Second");
      expect(Enum14.Third.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.Third]).assertEqual("Third");
      expect(Enum14.One.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.One]).assertEqual("One");
      expect(Enum14.one.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.one]).assertEqual("one");
      expect(Enum14.oNe.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.oNe]).assertEqual("oNe");
      expect(testNS18.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_1000
     * @tc.name      testEnumerationWithExplicitType0038
     * @tc.desc      Checking for enum with explicit byte type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum14.Red.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.Red]).assertEqual("Red");
      expect(Enum14.Green.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.Green]).assertEqual("Green");
      expect(Enum14.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.Blue]).assertEqual("Blue");
      expect(Enum14.First.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.First]).assertEqual("First");
      expect(Enum14.Second.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.Second]).assertEqual("Second");
      expect(Enum14.Third.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.Third]).assertEqual("Third");
      expect(Enum14.One.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.One]).assertEqual("One");
      expect(Enum14.one.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.one]).assertEqual("one");
      expect(Enum14.oNe.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[Enum14.oNe]).assertEqual("oNe");
      expect(testNS19.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_1100
     * @tc.name      testEnumerationWithExplicitType0039
     * @tc.desc      Checking for enum with explicit byte type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum14 = Enum14.Red;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("Red");
      c = Enum14.Green;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("Green");
      c = Enum14.Blue;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("Blue");
      c = Enum14.First;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("First");
      c = Enum14.Second;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("Second");
      c = Enum14.Third;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("Third");
      c = Enum14.One;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("One");
      c = Enum14.one;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("one");
      c = Enum14.oNe;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("oNe");
      expect(testNS20.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_1200
     * @tc.name      testEnumerationWithExplicitType0040
     * @tc.desc      Checking for enum with explicit byte type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum14 = Enum14.Red;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("Red");
      c = Enum14.Green;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("Green");
      c = Enum14.Blue;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("Blue");
      c = Enum14.First;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("First");
      c = Enum14.Second;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("Second");
      c = Enum14.Third;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("Third");
      c = Enum14.One;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("One");
      c = Enum14.one;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("one");
      c = Enum14.oNe;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(Enum14[c]).assertEqual("oNe");
      expect(testNS21.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_1300
     * @tc.name      testEnumerationWithExplicitType0041
     * @tc.desc      Checking for enum with explicit short type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum15.Red.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.Red]).assertEqual("Red");
      expect(Enum15.Green.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.Green]).assertEqual("Green");
      expect(Enum15.Blue.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.Blue]).assertEqual("Blue");
      expect(Enum15.First.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.First]).assertEqual("First");
      expect(Enum15.Second.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.Second]).assertEqual("Second");
      expect(Enum15.Third.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.Third]).assertEqual("Third");
      expect(Enum15.One.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.One]).assertEqual("One");
      expect(Enum15.one.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.one]).assertEqual("one");
      expect(Enum15.oNe.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.oNe]).assertEqual("oNe");
      expect(testNS22.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_1400
     * @tc.name      testEnumerationWithExplicitType0042
     * @tc.desc      Checking for enum with explicit short type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum15.Red.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.Red]).assertEqual("Red");
      expect(Enum15.Green.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.Green]).assertEqual("Green");
      expect(Enum15.Blue.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.Blue]).assertEqual("Blue");
      expect(Enum15.First.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.First]).assertEqual("First");
      expect(Enum15.Second.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.Second]).assertEqual("Second");
      expect(Enum15.Third.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.Third]).assertEqual("Third");
      expect(Enum15.One.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.One]).assertEqual("One");
      expect(Enum15.one.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.one]).assertEqual("one");
      expect(Enum15.oNe.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[Enum15.oNe]).assertEqual("oNe");
      expect(testNS23.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_1500
     * @tc.name      testEnumerationWithExplicitType0043
     * @tc.desc      Checking for enum with explicit short type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum15 = Enum15.Red;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("Red");
      c = Enum15.Green;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("Green");
      c = Enum15.Blue;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("Blue");
      c = Enum15.First;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("First");
      c = Enum15.Second;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("Second");
      c = Enum15.Third;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("Third");
      c = Enum15.One;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("One");
      c = Enum15.one;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("one");
      c = Enum15.oNe;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("oNe");
      expect(testNS24.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_1600
     * @tc.name      testEnumerationWithExplicitType0044
     * @tc.desc      Checking for enum with explicit short type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum15 = Enum15.Red;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("Red");
      c = Enum15.Green;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("Green");
      c = Enum15.Blue;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("Blue");
      c = Enum15.First;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("First");
      c = Enum15.Second;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("Second");
      c = Enum15.Third;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("Third");
      c = Enum15.One;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("One");
      c = Enum15.one;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("one");
      c = Enum15.oNe;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(Enum15[c]).assertEqual("oNe");
      expect(testNS25.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_1700
     * @tc.name      testEnumerationWithExplicitType0045
     * @tc.desc      Checking for enum with explicit double type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum16.Red.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.Red]).assertEqual("Red");
      expect(Enum16.Green.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.Green]).assertEqual("Green");
      expect(Enum16.Blue.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.Blue]).assertEqual("Blue");
      expect(Enum16.First.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.First]).assertEqual("First");
      expect(Enum16.Second.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.Second]).assertEqual("Second");
      expect(Enum16.Third.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.Third]).assertEqual("Third");
      expect(Enum16.One.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.One]).assertEqual("One");
      expect(Enum16.one.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.one]).assertEqual("one");
      expect(Enum16.oNe.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.oNe]).assertEqual("oNe");
      expect(testNS26.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_1800
     * @tc.name      testEnumerationWithExplicitType0046
     * @tc.desc      Checking for enum with explicit double type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum16.Red.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.Red]).assertEqual("Red");
      expect(Enum16.Green.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.Green]).assertEqual("Green");
      expect(Enum16.Blue.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.Blue]).assertEqual("Blue");
      expect(Enum16.First.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.First]).assertEqual("First");
      expect(Enum16.Second.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.Second]).assertEqual("Second");
      expect(Enum16.Third.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.Third]).assertEqual("Third");
      expect(Enum16.One.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.One]).assertEqual("One");
      expect(Enum16.one.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.one]).assertEqual("one");
      expect(Enum16.oNe.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[Enum16.oNe]).assertEqual("oNe");
      expect(testNS27.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_1900
     * @tc.name      testEnumerationWithExplicitType0047
     * @tc.desc      Checking for enum with explicit double type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum16 = Enum16.Red;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("Red");
      c = Enum16.Green;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("Green");
      c = Enum16.Blue;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("Blue");
      c = Enum16.First;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("First");
      c = Enum16.Second;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("Second");
      c = Enum16.Third;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("Third");
      c = Enum16.One;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("One");
      c = Enum16.one;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("one");
      c = Enum16.oNe;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("oNe");
      expect(testNS28.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_2000
     * @tc.name      testEnumerationWithExplicitType0048
     * @tc.desc      Checking for enum with explicit double type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum16 = Enum16.Red;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("Red");
      c = Enum16.Green;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("Green");
      c = Enum16.Blue;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("Blue");
      c = Enum16.First;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("First");
      c = Enum16.Second;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("Second");
      c = Enum16.Third;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("Third");
      c = Enum16.One;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("One");
      c = Enum16.one;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("one");
      c = Enum16.oNe;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(Enum16[c]).assertEqual("oNe");
      expect(testNS29.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_2100
     * @tc.name      testEnumerationWithExplicitType0049
     * @tc.desc      Checking for enum with explicit float type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum17.Red.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.Red]).assertEqual("Red");
      expect(Enum17.Green.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.Green]).assertEqual("Green");
      expect(Enum17.Blue.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.Blue]).assertEqual("Blue");
      expect(Enum17.First.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.First]).assertEqual("First");
      expect(Enum17.Second.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.Second]).assertEqual("Second");
      expect(Enum17.Third.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.Third]).assertEqual("Third");
      expect(Enum17.One.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.One]).assertEqual("One");
      expect(Enum17.one.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.one]).assertEqual("one");
      expect(Enum17.oNe.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.oNe]).assertEqual("oNe");
      expect(testNS30.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_2200
     * @tc.name      testEnumerationWithExplicitType0050
     * @tc.desc      Checking for enum with explicit float type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum17.Red.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.Red]).assertEqual("Red");
      expect(Enum17.Green.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.Green]).assertEqual("Green");
      expect(Enum17.Blue.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.Blue]).assertEqual("Blue");
      expect(Enum17.First.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.First]).assertEqual("First");
      expect(Enum17.Second.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.Second]).assertEqual("Second");
      expect(Enum17.Third.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.Third]).assertEqual("Third");
      expect(Enum17.One.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.One]).assertEqual("One");
      expect(Enum17.one.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.one]).assertEqual("one");
      expect(Enum17.oNe.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[Enum17.oNe]).assertEqual("oNe");
      expect(testNS31.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_2300
     * @tc.name      testEnumerationWithExplicitType0051
     * @tc.desc      Checking for enum with explicit float type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum17 = Enum17.Red;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("Red");
      c = Enum17.Green;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("Green");
      c = Enum17.Blue;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("Blue");
      c = Enum17.First;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("First");
      c = Enum17.Second;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("Second");
      c = Enum17.Third;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("Third");
      c = Enum17.One;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("One");
      c = Enum17.one;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("one");
      c = Enum17.oNe;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("oNe");
      expect(testNS32.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TWO_TEST_2400
     * @tc.name      testEnumerationWithExplicitType0052
     * @tc.desc      Checking for enum with explicit float type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum17 = Enum17.Red;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("Red");
      c = Enum17.Green;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("Green");
      c = Enum17.Blue;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("Blue");
      c = Enum17.First;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("First");
      c = Enum17.Second;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("Second");
      c = Enum17.Third;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("Third");
      c = Enum17.One;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("One");
      c = Enum17.one;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("one");
      c = Enum17.oNe;
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(Enum17[c]).assertEqual("oNe");
      expect(testNS33.runTest()).assertEqual(true);
    });
  })
}