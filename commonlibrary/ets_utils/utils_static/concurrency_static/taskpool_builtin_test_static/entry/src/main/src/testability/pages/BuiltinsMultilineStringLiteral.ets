'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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


export function BuiltinsMultilineStringLiteralTest0100(): void {
  let TAG='BuiltinsMultilineStringLiteralTest'
  try {
    const repeatStr = `La`;
    const repeated = `${repeatStr.repeat(3)}`;
    if(repeated!=`LaLaLa`){
      throw new Error(`${TAG} value.toString() invalid: ${repeated}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function BuiltinsMultilineStringLiteralTest1600(): void {
  let TAG='BuiltinsMultilineStringLiteralTest1600'
  try {
    const isMember = true;
    const accessMsg = `You ${isMember? 'have' : 'do not have'} access.
      Please check your membership.`;
    if(accessMsg !=`You have access.
      Please check your membership.`){
      throw new Error(`${TAG} value.toString() invalid: ${accessMsg.toString()}`)
    }

  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

