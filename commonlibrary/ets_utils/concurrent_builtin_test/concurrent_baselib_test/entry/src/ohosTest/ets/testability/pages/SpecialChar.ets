import { GeneratedObjectLiteralInterface_1, specChars } from "../../test/SpecialChar.test";

import { identifier } from "@kit.AdsKit";

import { ArkTSUtils, buffer, JSON, util, xml } from '@kit.ArkTS';


@Concurrent
export function bufferAlloc() {
  let TAG = 'bufferAlloc'
  try {
    try {
      let buf1 = buffer.alloc(97, specChars, 'utf8');
      console.log(`${TAG} success: ${buf1.toString('utf-8')}`);
      console.log(`${TAG} success: ${specChars}`, specChars.length);
      // expect(buf1.toString('utf-8')).assertEqual(specChars);
      if (buf1.toString('utf-8') !== specChars) {
        throw new Error(`${TAG} value.toString() invalid: ${buf1.toString('utf-8').toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function bufferByteLength() {
  let TAG = 'bufferByteLength'
  try {
    try {
      let str = specChars;
      console.log(`${str}: ${str.length} characters, ${buffer.byteLength(str, 'utf-8')} bytes`);
      // expect(buffer.byteLength(str, 'utf-8')).assertEqual(97);
      if (buffer.byteLength(str, 'utf-8') !== 97) {
        throw new Error(`${TAG} value.toString() invalid: ${buffer.byteLength(str, 'utf-8').toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function bufferIsBuffer() {
  let TAG = 'bufferIsBuffer'
  try {
    try {
      let result = buffer.isBuffer(specChars);
      console.log(`This is equal result ${result}`);
      // expect(result).assertEqual(false);
      if (result !== false) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function bufferIsEncoding() {
  let TAG = 'bufferIsEncoding'
  try {
    try {
      let result = buffer.isEncoding(specChars).toString();
      console.log(`This is equal result ${result}`);
      // expect(result).assertEqual("false");
      if (result !== "false") {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function bufferFill() {
  let TAG = 'bufferFill'
  try {
    try {
      let b = buffer.allocUninitializedFromPool(2).fill(specChars);
      console.log(`This is b ${b.toString()}`);
      // expect(b.toString()).assertEqual(" ï");
      if (b.toString() !== " ï") {
        throw new Error(`${TAG} value.toString() invalid: ${b.toString().toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function bufferIncludes() {
  let TAG = 'bufferIncludes'
  try {
    try {
      let buf = buffer.from(specChars);
      console.log(buf.includes(specChars).toString());
      console.log(buf.includes('be').toString());
      // expect(buf.includes(specChars).toString()).assertEqual("true");
      if (buf.includes(specChars).toString() !== "true") {
        throw new Error(`${TAG} value.toString() invalid: ${buf.includes(specChars).toString().toString()}`)
      }
      // expect(buf.includes('be').toString()).assertEqual("false");
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export function bufferIndexOf() {
  let TAG = 'bufferIndexOf'
  try {
    try {
      let buf = buffer.from(specChars);
      console.log(buf.indexOf(specChars).toString());
      console.log(buf.indexOf('no exist').toString());
      // expect(buf.indexOf(specChars).toString()).assertEqual("0");
      if (buf.indexOf(specChars).toString() !== "0") {
        throw new Error(`${TAG} value.toString() invalid: ${buf.indexOf(specChars).toString().toString()}`)
      }
      // expect(buf.indexOf('no exist').toString()).assertEqual("-1");
      if (buf.indexOf('no exist').toString() !== "-1") {
        throw new Error(`${TAG} value.toString() invalid: ${buf.indexOf('no exist').toString().toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function bufferLastIndexOf() {
  let TAG = 'bufferLastIndexOf'
  try {
    try {
      let buf = buffer.from(specChars);
      console.log(buf.lastIndexOf(specChars).toString());
      console.log(buf.lastIndexOf('no exist').toString());
      // expect(buf.lastIndexOf(specChars).toString()).assertEqual("0");
      if (buf.lastIndexOf(specChars).toString() !== "0") {
        throw new Error(`${TAG} value.toString() invalid: ${buf.lastIndexOf(specChars).toString().toString()}`)
      }
      // expect(buf.lastIndexOf('no exist').toString()).assertEqual("-1");
      if (buf.lastIndexOf('no exist').toString() !== "-1") {
        throw new Error(`${TAG} value.toString() invalid: ${buf.lastIndexOf('no exist').toString().toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function bufferToJSON() {
  let TAG = 'bufferToJSON'
  try {
    try {
      let buf1 = buffer.from(specChars);
      let obj = buf1.toJSON();
      console.log(JSON.stringify(obj));
      // expect(JSON.stringify(obj))
      //   .assertEqual('{"type":"Buffer","data":[32,239,188,129,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126]}');
      if (JSON.stringify(obj) !==
        '{"type":"Buffer","data":[32,239,188,129,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126]}') {
        throw new Error(`${TAG} value.toString() invalid: ${JSON.stringify(obj).toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export function bufferToString() {
  let TAG = 'bufferToString'
  try {
    try {
      let buf = buffer.from(specChars);
      console.log(buf.toString('utf-8'));
      // expect(buf.toString('utf-8'))
      //   .assertEqual(' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');
      if (buf.toString('utf-8') !==
        ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~') {
        throw new Error(`${TAG} value.toString() invalid: ${buf.toString('utf-8').toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function bufferWrite() {
  let TAG = 'bufferWrite'
  try {
    try {
      let buf = buffer.alloc(97);
      let len = buf.write(specChars);
      console.log(`${len} bytes: ${buf.toString('utf-8', 0, len)}`);
      // expect(buf.write(specChars)).assertEqual(97);
      if (buf.write(specChars) !== 97) {
        throw new Error(`${TAG} value.toString() invalid: ${buf.write(specChars).toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function bufferText() {
  let TAG = 'bufferText'
  try {
    try {
      let blob1: buffer.Blob = new buffer.Blob([specChars]);
      let pro1 = blob1.text();
      let val1 = await pro1;
      console.log(val1);
      // expect(val1.toString()).assertEqual(specChars);
      if (val1.toString() !== specChars) {
        throw new Error(`${TAG} value.toString() invalid: ${val1.toString().toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringConstructor() {
  let TAG = 'stringConstructor'
  try {
    try {
      const strFunctionResult = String(specChars);
      const strConstructorResult = new String(specChars);
      // expect(strFunctionResult).assertEqual(specChars);
      if (strFunctionResult !== specChars) {
        throw new Error(`${TAG} value.toString() invalid: ${strFunctionResult.toString()}`)
      }
      // expect(strConstructorResult.valueOf()).assertEqual(specChars);
      if (strConstructorResult.valueOf() !== specChars) {
        throw new Error(`${TAG} value.toString() invalid: ${strConstructorResult.valueOf().toString()}`)
      }
      // expect(strFunctionResult).assertEqual(strConstructorResult.valueOf());
      if (strFunctionResult !== strConstructorResult.valueOf()) {
        throw new Error(`${TAG} value.toString() invalid: ${strFunctionResult.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringRaw() {
  let TAG = 'stringRaw'
  try {
    try {
      const rawString =
        String.raw` ！"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_abcdefghijklmnopqrstuvwxyz{|}~`;
      const specialInterpolatedString = String.raw`${specChars}`;
      // expect(rawString)
      //   .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\\\]^_abcdefghijklmnopqrstuvwxyz{|}~");
      if (rawString !==
        " ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\\\]^_abcdefghijklmnopqrstuvwxyz{|}~") {
        throw new Error(`${TAG} value.toString() invalid: ${rawString.toString()}`)
      }
      // expect(specialInterpolatedString).assertEqual(specChars);
      if (specialInterpolatedString !== specChars) {
        throw new Error(`${TAG} value.toString() invalid: ${specialInterpolatedString.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }

  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function stringPrototypeCharAt() {
  let TAG = 'stringPrototypeCharAt'
  try {
    try {
      const index = 5;
      const result = specChars.charAt(index).toString();
      // expect(result).assertEqual("%");
      if (result !== "%") {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }

  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function stringPrototypeCharCodeAt() {
  let TAG = 'stringPrototypeCharCodeAt'
  try {
    try {
      const index = 5;
      const result = specChars.charCodeAt(index);
      // expect(result).assertEqual(37);
      if (result !== 37) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringPrototypeCharCodePointAt() {
  let TAG = 'stringPrototypeCharCodePointAt'
  try {
    try {
      const index = 5;
      const result = specChars.codePointAt(index);
      // expect(result).assertEqual(37);
      if (result !== 37) {
        throw new Error(`${TAG} value.toString() invalid: ${result}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringPrototypeConcat() {
  let TAG = 'stringPrototypeConcat'
  try {
    try {
      const result = specChars.concat("Hello World");
      // expect(result)
      //   .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~Hello World");
      if (result !==
        " ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~Hello World") {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringPrototypeEndsWith() {
  let TAG = 'stringPrototypeEndsWith'
  try {
    try {
      const result = specChars.endsWith("~");
      // expect(result).assertEqual(true);
      if (result !== true) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringPrototypeIncludes() {
  let TAG = 'stringPrototypeIncludes'
  try {
    try {
      const result = specChars.includes("~");
      // expect(result).assertEqual(true);
      if (result !== true) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringPrototypeIndexOf() {
  let TAG = 'stringPrototypeIndexOf'
  try {
    try {
      const result = specChars.indexOf("~");
      // expect(result).assertEqual(94);
      if (result !== 94) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringPrototypeLastIndexOf() {
  let TAG = 'stringPrototypeLastIndexOf'
  try {
    try {
      const result = specChars.lastIndexOf("~");
      // expect(result).assertEqual(94);
      if (result !== 94) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function stringMatch() {
  let TAG = 'stringMatch'
  try {
    try {
      const regex = /[A-Z]/g;
      const result = specChars.match(regex)?.toString();
      // expect(result).assertEqual("A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z");
      if (result !== "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z") {
        throw new Error(`${TAG} value.toString() invalid: ${result}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}



@Concurrent
export async function stringPrototypeNormalize() {
  let TAG = 'stringPrototypeNormalize'
  try {
    try {
      const result = specChars.normalize();
      // expect(result).assertEqual(specChars);
      if (result !== specChars) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function stringPrototypePadEnd() {
  let TAG = 'stringPrototypePadEnd'
  try {
    try {
      const result = specChars.padEnd(100, "*");
      // expect(result)
      //   .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~*****");
      if (result !==
        " ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~*****") {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringPrototypePadStart() {
  let TAG = 'stringPrototypePadStart'
  try {
    try {
      const result = specChars.padStart(100, "*");
      // expect(result)
      //   .assertEqual("***** ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      if (result !==
        "***** ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~") {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function stringPrototypeRepeat() {
  let TAG = 'stringPrototypeRepeat'
  try {
    try {
      const result = specChars.repeat(1);
      // expect(result).assertEqual(specChars);
      if (result !== specChars) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function stringPrototypeReplace() {
  let TAG = 'stringPrototypeReplace'
  try {
    try {
      const result = specChars.replace("！", "?").toString();
      // expect(result)
      //   .assertEqual(" ?\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      if (result !==
        " ?\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~") {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringPrototypeSearch() {
  let TAG = 'stringPrototypeSearch'
  try {
    try {
      const regex = /[^\w\s']/g;
      const result = specChars.search(regex);
      // expect(result).assertEqual(1);
      if (result !== 1) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringPrototypeSlice() {
  let TAG = 'stringPrototypeSlice'
  try {
    try {
      const result = specChars.slice(0, 96);
      // expect(result).assertEqual(specChars);
      if (result !== specChars) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function stringPrototypeStartsWith() {
  let TAG = 'stringPrototypeStartsWith'
  try {
    try {
      const result = specChars.startsWith('Sat');
      // expect(result).assertEqual(false);
      if (result !== false) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringPrototypeSubstring() {
  let TAG = 'stringPrototypeSubstring'
  try {
    try {
      const result = specChars.substring(1, 3);
      // expect(result).assertEqual("！\"");
      if (result !== "！\"") {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringPrototypeToLocaleLowerCase() {
  let TAG = 'stringPrototypeToLocaleLowerCase'
  try {
    try {
      const result = specChars.toLocaleLowerCase('en-US');
      // expect(result)
      //   .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@abcdefghijklmnopqrstuvwxyz[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      if (result !==
        " ！\"#$%&'()*+,-./0123456789:;<=>?@abcdefghijklmnopqrstuvwxyz[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~") {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringPrototypeToLocaleUpperCase() {
  let TAG = 'stringPrototypeToLocaleUpperCase'
  try {
    try {
      const result = specChars.toLocaleUpperCase('en-US');
      // expect(result)
      //   .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~");
      if (result !==
        " ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~") {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringPrototypeToLowerCase() {
  let TAG = 'stringPrototypeToLowerCase'
  try {
    try {
      const result = specChars.toLowerCase();
      // expect(result)
      //   .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@abcdefghijklmnopqrstuvwxyz[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      if (result !==
        " ！\"#$%&'()*+,-./0123456789:;<=>?@abcdefghijklmnopqrstuvwxyz[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~") {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function stringPrototypeToString() {
  let TAG = 'stringPrototypeToString'
  try {
    try {
      const result = specChars.toString();
      // expect(result).assertEqual(specChars);
      if (result !== specChars) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export async function stringPrototypeToUpperCase() {
  let TAG = 'stringPrototypeToUpperCase'
  try {
    try {
      const result = specChars.toUpperCase();
      // expect(result)
      //   .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~");
      if (result !==
        " ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~") {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function stringPrototypeTrim() {
  let TAG = 'stringPrototypeTrim'
  try {
    try {
      const result = specChars.trim();
      // expect(result)
      // .assertEqual("！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      if (result !==
        "！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~") {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function stringPrototypeTrimEnd() {
  let TAG = 'stringPrototypeTrimEnd'
  try {
    try {
      const result = specChars.trimEnd();
      // expect(result)
      //   .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      if (result !==
        " ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~") {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function stringPrototypeTrimStart() {
  let TAG = 'stringPrototypeTrimStart'
  try {
    try {
      const result = specChars.trimStart();
      console.log(`+++(${result})`)
      // expect(result)
      //   .assertEqual("！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      if (result !==
        "！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~") {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function stringPrototypeValueOf() {
  let TAG = 'stringPrototypeValueOf'
  try {
    try {
      const result = specChars.valueOf();
      // expect(result).assertEqual(specChars);
      if (result !== specChars) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function jsonStringify() {
  let TAG = 'jsonStringify'
  try {
    try {
      let specChars =
        ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      let util = JSON.stringify(specChars);
      // expect(util)
      //   .assertEqual('" ！\\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"');
      if (util !==
        '" ！\\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"') {
        throw new Error(`${TAG} value.toString() invalid: ${util.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function jsonParse() {
  let TAG = 'jsonParse'
  try {
    try {
      let specChars =
        ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      let util1 = JSON.stringify(specChars);
      let util = JSON.parse(util1);
      // expect(util).assertEqual(specChars);
      if (util !== specChars) {
        throw new Error(`${TAG} value.toString() invalid`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function jsonHas() {
  let TAG = 'jsonHas'
  try {
    try {
      let specChars =
        ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      let util1: GeneratedObjectLiteralInterface_1 = {
        ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~': "123"
      };
      let util = JSON.has(util1, specChars);
      // expect(util).assertEqual(true);
      if (util !== true) {
        throw new Error(`${TAG} value.toString() invalid: ${util.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export async function jsonRemove() {
  let TAG = 'jsonRemove'
  try {
    try {
      let util1: GeneratedObjectLiteralInterface_1 = {
        ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~': "123"
      };
      let specChars =
        ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      JSON.remove(util1, specChars);
      // expect(JSON.stringify(util1)).assertEqual('{}');
      if (JSON.stringify(util1) !=='{}' ) {
        throw new Error(`${TAG} value.toString() invalid: ${JSON.stringify(util1).toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}