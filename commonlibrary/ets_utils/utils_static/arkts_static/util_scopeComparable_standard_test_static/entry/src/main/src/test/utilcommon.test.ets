'use static';

import util from '@ohos.util';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default class Utils {
  static dateFromTime(timestamp: long): Date {
    let date = new Date(1970, 0);
    date.setTime(timestamp);
    return date;
  }

  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve: (value: int | PromiseLike<int>) => void, reject: (value: Error) => void) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    });
  }
}

export class ScopeHelperClampPart01Test59BoolTemp implements util.ScopeComparable<ScopeHelperClampPart01Test59BoolTemp> {
  private readonly _val: boolean;
  constructor(value: boolean) {
    this._val = value;
  }
  compareTo(other: ScopeHelperClampPart01Test59BoolTemp): boolean {
    if (this._val === other.getValue()) {
      return true;
    }
    if (this._val) {
      return true;
    }
    return false;
  }
  getValue(): boolean {
    return this._val;
  }
  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperConstructorPart01Test39StringTemp implements util.ScopeComparable<ScopeHelperConstructorPart01Test39StringTemp> {
  private readonly _temp: string;
  constructor(value: string) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperConstructorPart01Test39StringTemp): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): string {
    return this._temp;
  }
  toString(): string {
    return this._temp;
  }
}

export class ScopeHelperConstructorPart02Test17Speed implements util.ScopeComparable<ScopeHelperConstructorPart02Test17Speed> {
  private readonly _speed: int;
  constructor(value: int) {
    this._speed = value;
  }
  compareTo(value: ScopeHelperConstructorPart02Test17Speed): boolean {
    return this._speed >= value.getSpeed();
  }
  getSpeed(): int {
    return this._speed;
  }
  toString(): string {
    return this._speed.toString();
  }
}

export class ScopeHelperConstructorPart03Test3AllTrueT3 implements util.ScopeComparable<ScopeHelperConstructorPart03Test3AllTrueT3> {
  private readonly _temp: int;

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(value: ScopeHelperConstructorPart03Test3AllTrueT3): boolean {
    return true;
  }

  getTemp(): int {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperContainsPart01Test40TempDouble implements util.ScopeComparable<ScopeHelperContainsPart01Test40TempDouble> {
  private readonly _temp: number;
  constructor(value: number) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperContainsPart01Test40TempDouble): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): number {
    return this._temp;
  }
}

export class ScopeHelperContainsPart01Test47TempLong implements util.ScopeComparable<ScopeHelperContainsPart01Test47TempLong> {
  private readonly _temp: long;
  constructor(value: long) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperContainsPart01Test47TempLong): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): long {
    return this._temp;
  }
}

export class ScopeHelperContainsPart01Test57TempFloat implements util.ScopeComparable<ScopeHelperContainsPart01Test57TempFloat> {
  private readonly _temp: float;
  constructor(value: float) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperContainsPart01Test57TempFloat): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): float {
    return this._temp;
  }
}

export class ScopeHelperContainsPart02Test48TempByte implements util.ScopeComparable<ScopeHelperContainsPart02Test48TempByte> {
  private readonly _temp: byte;
  constructor(value: byte) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperContainsPart02Test48TempByte): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): byte {
    return this._temp;
  }
}

export class ScopeHelperContainsPart02Test52TempShort implements util.ScopeComparable<ScopeHelperContainsPart02Test52TempShort> {
  private readonly _temp: short;
  constructor(value: short) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperContainsPart02Test52TempShort): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): short {
    return this._temp;
  }
}

export class ScopeHelperContainsPart02Test59TempChar implements util.ScopeComparable<ScopeHelperContainsPart02Test59TempChar> {
  private readonly _temp: char;
  constructor(value: char) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperContainsPart02Test59TempChar): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): char {
    return this._temp;
  }
}

export class ScopeHelperContainsPart02Test63TempBool implements util.ScopeComparable<ScopeHelperContainsPart02Test63TempBool> {
  private readonly _temp: boolean;
  constructor(value: boolean) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperContainsPart02Test63TempBool): boolean {
    return this._temp || !value.getTemp();
  }
  getTemp(): boolean {
    return this._temp;
  }
}

export class ScopeHelperContainsPart02Test71TempString implements util.ScopeComparable<ScopeHelperContainsPart02Test71TempString> {
  private readonly _temp: string;
  constructor(value: string) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperContainsPart02Test71TempString): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): string {
    return this._temp;
  }
}

export class ScopeHelperContainsPart02Test77TempDate implements util.ScopeComparable<ScopeHelperContainsPart02Test77TempDate> {
  private readonly _temp: Date;
  constructor(value: Date) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperContainsPart02Test77TempDate): boolean {
    return this._temp.getTime() >= value.getTemp().getTime();
  }
  getTemp(): Date {
    return this._temp;
  }
}

export class ScopeHelperExpandPart02Test40TemperatureDouble implements util.ScopeComparable<ScopeHelperExpandPart02Test40TemperatureDouble> {
  private readonly _temp: double;
  constructor(value: double) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperExpandPart02Test40TemperatureDouble): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): double {
    return this._temp;
  }
  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperExpandPart02Test41TemperatureLong implements util.ScopeComparable<ScopeHelperExpandPart02Test41TemperatureLong> {
  private readonly _temp: long;
  constructor(value: long) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperExpandPart02Test41TemperatureLong): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): long {
    return this._temp;
  }
  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperExpandPart02Test42TemperatureString implements util.ScopeComparable<ScopeHelperExpandPart02Test42TemperatureString> {
  private readonly _str: string;
  constructor(value: string) {
    this._str = value;
  }
  compareTo(value: ScopeHelperExpandPart02Test42TemperatureString): boolean {
    return this._str >= value.getStr();
  }
  getStr(): string {
    return this._str;
  }
  toString(): string {
    return this._str;
  }
}

export class ScopeHelperExpandPart02Test43TemperatureBigint implements util.ScopeComparable<ScopeHelperExpandPart02Test43TemperatureBigint> {
  private readonly _temp: bigint;
  constructor(value: bigint) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperExpandPart02Test43TemperatureBigint): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): bigint {
    return this._temp;
  }
  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperExpandPart02Test44FlippedOrder implements util.ScopeComparable<ScopeHelperExpandPart02Test44FlippedOrder> {
  private readonly _val: int;
  constructor(value: int) {
    this._val = value;
  }
  compareTo(value: ScopeHelperExpandPart02Test44FlippedOrder): boolean {
    return this._val <= value.getVal();
  }
  getVal(): int {
    return this._val;
  }
  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperExpandPart02Test45CompareSelf implements util.ScopeComparable<ScopeHelperExpandPart02Test45CompareSelf> {
  private readonly _val: int;
  constructor(value: int) {
    this._val = value;
  }
  compareTo(value: ScopeHelperExpandPart02Test45CompareSelf): boolean {
    return true;
  }
  getVal(): int {
    return this._val;
  }
  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperExpandPart02Test46TemperatureEpoch implements util.ScopeComparable<ScopeHelperExpandPart02Test46TemperatureEpoch> {
  private readonly _ms: long;
  constructor(value: long) {
    this._ms = value;
  }
  compareTo(value: ScopeHelperExpandPart02Test46TemperatureEpoch): boolean {
    return this._ms >= value.getMs();
  }
  getMs(): long {
    return this._ms;
  }
  toString(): string {
    return this._ms.toString();
  }
}

export class ScopeHelperExpandPart02Test47TemperatureFold implements util.ScopeComparable<ScopeHelperExpandPart02Test47TemperatureFold> {
  private readonly _str: string;
  constructor(value: string) {
    this._str = value;
  }
  compareTo(value: ScopeHelperExpandPart02Test47TemperatureFold): boolean {
    return this._str.toLowerCase() >= value.getStr().toLowerCase();
  }
  getStr(): string {
    return this._str;
  }
  toString(): string {
    return this._str;
  }
}

export class ScopeHelperExpandPart02Test48TemperatureFloat implements util.ScopeComparable<ScopeHelperExpandPart02Test48TemperatureFloat> {
  private readonly _temp: float;
  constructor(value: float) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperExpandPart02Test48TemperatureFloat): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): float {
    return this._temp;
  }
  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperExpandPart02Test49TemperatureByte implements util.ScopeComparable<ScopeHelperExpandPart02Test49TemperatureByte> {
  private readonly _temp: byte;
  constructor(value: byte) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperExpandPart02Test49TemperatureByte): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): byte {
    return this._temp;
  }
  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperExpandPart02Test50TemperatureShort implements util.ScopeComparable<ScopeHelperExpandPart02Test50TemperatureShort> {
  private readonly _temp: short;
  constructor(value: short) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperExpandPart02Test50TemperatureShort): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): short {
    return this._temp;
  }
  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperExpandPart02Test51TemperatureChar implements util.ScopeComparable<ScopeHelperExpandPart02Test51TemperatureChar> {
  private readonly _temp: char;
  constructor(value: char) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperExpandPart02Test51TemperatureChar): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): char {
    return this._temp;
  }
  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperExpandPart04Test31BadCompare implements util.ScopeComparable<ScopeHelperExpandPart04Test31BadCompare> {
  private _value: int;
  constructor(value: int) {
    this._value = value;
  }
  compareTo(value: ScopeHelperExpandPart04Test31BadCompare): boolean {
    throw new Error('compare failed');
  }
  getValue(): int {
    return this._value;
  }
  toString(): string {
    return this._value.toString();
  }
}

export class ScopeHelperExpandPart04Test38GuardCompare implements util.ScopeComparable<ScopeHelperExpandPart04Test38GuardCompare> {
  private _value: int;
  constructor(value: int) {
    this._value = value;
  }
  compareTo(value: ScopeHelperExpandPart04Test38GuardCompare): boolean {
    if (value.getValue() >= 100) {
      throw new Error('out of range');
    }
    return this._value >= value.getValue();
  }
  getValue(): int {
    return this._value;
  }
  toString(): string {
    return this._value.toString();
  }
}

export class ScopeHelperExpandPart04Test59Price implements util.ScopeComparable<ScopeHelperExpandPart04Test59Price> {
  private _value: int;
  constructor(value: int) {
    this._value = value;
  }
  compareTo(value: ScopeHelperExpandPart04Test59Price): boolean {
    return this._value >= value.getPrice();
  }
  getPrice(): int {
    return this._value;
  }
  setPrice(v: int): void {
    this._value = v;
  }
  toString(): string {
    return this._value.toString();
  }
}

export class ScopeHelperGetLowerPart01Test2TemperatureB implements util.ScopeComparable<ScopeHelperGetLowerPart01Test2TemperatureB> {
  private _temp: int = 0;
  constructor(value: int) {
    this._temp = value;
  }
  getTemp(): int {
    return this._temp;
  }

  compareTo(value: ScopeHelperGetLowerPart01Test2TemperatureB): boolean {
    return this._temp >= value.getTemp();
  }
}

export class ScopeHelperGetLowerPart01Test4TemperatureD implements util.ScopeComparable<ScopeHelperGetLowerPart01Test4TemperatureD> {
  private _temp: int = 0;
  constructor(value: int) {
    this._temp = value;
  }
  getTemp(): int {
    return this._temp;
  }
  setTemp(v: int): void {
    this._temp = v;
  }

  compareTo(value: ScopeHelperGetLowerPart01Test4TemperatureD): boolean {
    return this._temp >= value.getTemp();
  }
}

export class ScopeHelperGetLowerPart02Test3TempChain implements util.ScopeComparable<ScopeHelperGetLowerPart02Test3TempChain> {
  private _temp: int = 0;
  constructor(value: int) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperGetLowerPart02Test3TempChain): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): int {
    return this._temp;
  }
}

export class ScopeHelperIntersectPart01Test56StrTemp implements util.ScopeComparable<ScopeHelperIntersectPart01Test56StrTemp> {
  private readonly _v: string;
  constructor(value: string) {
    this._v = value;
  }
  compareTo(value: ScopeHelperIntersectPart01Test56StrTemp): boolean {
    return this._v >= value.getV();
  }
  getV(): string {
    return this._v;
  }
  toString(): string {
    return this._v;
  }
}

export class ScopeHelperIntersectPart01Test59LongTemp implements util.ScopeComparable<ScopeHelperIntersectPart01Test59LongTemp> {
  private readonly _v: long;
  constructor(value: long) {
    this._v = value;
  }
  compareTo(value: ScopeHelperIntersectPart01Test59LongTemp): boolean {
    return this._v >= value.getV();
  }
  getV(): long {
    return this._v;
  }
  toString(): string {
    return this._v.toString();
  }
}

export class ScopeHelperIntersectPart01Test62DblTemp implements util.ScopeComparable<ScopeHelperIntersectPart01Test62DblTemp> {
  private readonly _v: double;
  constructor(value: double) {
    this._v = value;
  }
  compareTo(value: ScopeHelperIntersectPart01Test62DblTemp): boolean {
    return this._v >= value.getV();
  }
  getV(): double {
    return this._v;
  }
  toString(): string {
    return this._v.toString();
  }
}

export class ScopeHelperIntersectPart01Test66ByteTemp implements util.ScopeComparable<ScopeHelperIntersectPart01Test66ByteTemp> {
  private readonly _v: byte;
  constructor(value: byte) {
    this._v = value;
  }
  compareTo(value: ScopeHelperIntersectPart01Test66ByteTemp): boolean {
    return this._v >= value.getV();
  }
  getV(): byte {
    return this._v;
  }
  toString(): string {
    return this._v.toString();
  }
}

export class ScopeHelperIntersectPart01Test68ShortTemp implements util.ScopeComparable<ScopeHelperIntersectPart01Test68ShortTemp> {
  private readonly _v: short;
  constructor(value: short) {
    this._v = value;
  }
  compareTo(value: ScopeHelperIntersectPart01Test68ShortTemp): boolean {
    return this._v >= value.getV();
  }
  getV(): short {
    return this._v;
  }
  toString(): string {
    return this._v.toString();
  }
}

export class ScopeHelperIntersectPart01Test70BigTemp implements util.ScopeComparable<ScopeHelperIntersectPart01Test70BigTemp> {
  private readonly _v: bigint;
  constructor(value: bigint) {
    this._v = value;
  }
  compareTo(value: ScopeHelperIntersectPart01Test70BigTemp): boolean {
    return this._v >= value.getV();
  }
  getV(): bigint {
    return this._v;
  }
  toString(): string {
    return this._v.toString();
  }
}

export class ScopeHelperIntersectPart01Test72DateTemp implements util.ScopeComparable<ScopeHelperIntersectPart01Test72DateTemp> {
  private readonly _v: Date;
  constructor(value: Date) {
    this._v = value;
  }
  compareTo(value: ScopeHelperIntersectPart01Test72DateTemp): boolean {
    return this._v.getTime() >= value.getV().getTime();
  }
  getV(): Date {
    return this._v;
  }
  toString(): string {
    return this._v.getTime().toString();
  }
}

export class ScopeHelperIntersectPart01Test75RegExpTemp implements util.ScopeComparable<ScopeHelperIntersectPart01Test75RegExpTemp> {
  private readonly _v: RegExp;
  constructor(value: RegExp) {
    this._v = value;
  }
  compareTo(value: ScopeHelperIntersectPart01Test75RegExpTemp): boolean {
    return this._v.toString() >= value.getV().toString();
  }
  getV(): RegExp {
    return this._v;
  }
  toString(): string {
    return this._v.toString();
  }
}

export class ScopeHelperIntersectPart01Test78ErrTemp implements util.ScopeComparable<ScopeHelperIntersectPart01Test78ErrTemp> {
  private readonly _v: Error;
  constructor(value: Error) {
    this._v = value;
  }
  compareTo(value: ScopeHelperIntersectPart01Test78ErrTemp): boolean {
    return this._v.message >= value.getV().message;
  }
  getV(): Error {
    return this._v;
  }
  toString(): string {
    return this._v.message;
  }
}

export class ScopeHelperIntersectPart01Test80PointTemp implements util.ScopeComparable<ScopeHelperIntersectPart01Test80PointTemp> {
  private readonly _x: int;
  private readonly _y: int;
  constructor(x: int, y: int) {
    this._x = x;
    this._y = y;
  }
  compareTo(value: ScopeHelperIntersectPart01Test80PointTemp): boolean {
    return this._x + this._y >= value.getX() + value.getY();
  }
  getX(): int {
    return this._x;
  }
  getY(): int {
    return this._y;
  }
  toString(): string {
    return '(' + this._x + ',' + this._y + ')';
  }
}

export class ScopeHelperIntersectPart01Test83ArrTemp implements util.ScopeComparable<ScopeHelperIntersectPart01Test83ArrTemp> {
  private readonly _v: int[];
  constructor(value: int[]) {
    this._v = value;
  }
  compareTo(value: ScopeHelperIntersectPart01Test83ArrTemp): boolean {
    return this._v.length >= value.getV().length;
  }
  getV(): int[] {
    return this._v;
  }
  toString(): string {
    return this._v.length.toString();
  }
}

export class ScopeHelperIntersectPart01Test85MapTemp implements util.ScopeComparable<ScopeHelperIntersectPart01Test85MapTemp> {
  private readonly _v: Map<string, int>;
  constructor(value: Map<string, int>) {
    this._v = value;
  }
  compareTo(value: ScopeHelperIntersectPart01Test85MapTemp): boolean {
    return this._v.size >= value.getV().size;
  }
  getV(): Map<string, int> {
    return this._v;
  }
  toString(): string {
    return this._v.size.toString();
  }
}

export class ScopeHelperIntersectPart01Test88SetTemp implements util.ScopeComparable<ScopeHelperIntersectPart01Test88SetTemp> {
  private readonly _v: Set<int>;
  constructor(value: Set<int>) {
    this._v = value;
  }
  compareTo(value: ScopeHelperIntersectPart01Test88SetTemp): boolean {
    return this._v.size >= value.getV().size;
  }
  getV(): Set<int> {
    return this._v;
  }
  toString(): string {
    return this._v.size.toString();
  }
}

export class ScopeHelperIntersectPart02Test7Endpoints {
  lower: ScopeHelperIntersectPart02Test27TempInt = new ScopeHelperIntersectPart02Test27TempInt(35);
  upper: ScopeHelperIntersectPart02Test27TempInt = new ScopeHelperIntersectPart02Test27TempInt(45);
}

export class ScopeHelperIntersectPart02Test27TempInt implements util.ScopeComparable<ScopeHelperIntersectPart02Test27TempInt> {
  private readonly _v: int;
  constructor(value: int) {
    this._v = value;
  }
  compareTo(value: ScopeHelperIntersectPart02Test27TempInt): boolean {
    return this._v >= value.getV();
  }
  getV(): int {
    return this._v;
  }
  toString(): string {
    return this._v.toString();
  }
}

export class ScopeHelperIntersectPart02Test66TempBool implements util.ScopeComparable<ScopeHelperIntersectPart02Test66TempBool> {
  private readonly _v: boolean;
  constructor(value: boolean) {
    this._v = value;
  }
  compareTo(value: ScopeHelperIntersectPart02Test66TempBool): boolean {
    return !value.getV() || this._v;
  }
  getV(): boolean {
    return this._v;
  }
  toString(): string {
    return this._v.toString();
  }
}

export class ScopeHelperIntersectPart02Test69TempChar implements util.ScopeComparable<ScopeHelperIntersectPart02Test69TempChar> {
  private readonly _v: char;
  constructor(value: char) {
    this._v = value;
  }
  compareTo(value: ScopeHelperIntersectPart02Test69TempChar): boolean {
    return this._v >= value.getV();
  }
  getV(): char {
    return this._v;
  }
  toString(): string {
    return this._v.toString();
  }
}

export class ScopeHelperIntersectPart02Test79TempPoint implements util.ScopeComparable<ScopeHelperIntersectPart02Test79TempPoint> {
  private readonly _x: int;
  private readonly _y: int;
  constructor(x: int, y: int) {
    this._x = x;
    this._y = y;
  }
  compareTo(value: ScopeHelperIntersectPart02Test79TempPoint): boolean {
    return this._x + this._y >= value.getX() + value.getY();
  }
  getX(): int {
    return this._x;
  }
  getY(): int {
    return this._y;
  }
  toString(): string {
    return (this._x + this._y).toString();
  }
}

export class ScopeHelperIntersectPart02Test82TempRect implements util.ScopeComparable<ScopeHelperIntersectPart02Test82TempRect> {
  private readonly _w: int;
  private readonly _h: int;
  constructor(w: int, h: int) {
    this._w = w;
    this._h = h;
  }
  compareTo(value: ScopeHelperIntersectPart02Test82TempRect): boolean {
    if (this._w === value.getW()) {
      return this._h >= value.getH();
    }
    return this._w >= value.getW();
  }
  getW(): int {
    return this._w;
  }
  getH(): int {
    return this._h;
  }
  toString(): string {
    return this._w.toString();
  }
}

export class StringDecoderConstructorPart01Test1DecoderHolder {
  dec: util.StringDecoder = new util.StringDecoder();
}

export class ScopeComparableCompareToPart01TestMissingDoubleWrap implements util.ScopeComparable<ScopeComparableCompareToPart01TestMissingDoubleWrap> {
  private readonly _val: double;

  constructor(value: double) {
    this._val = value;
  }

  compareTo(other: ScopeComparableCompareToPart01TestMissingDoubleWrap): boolean {
    return this._val >= other._val;
  }
}

export class ScopeComparableCompareToPart01TestMissingLongWrap implements util.ScopeComparable<ScopeComparableCompareToPart01TestMissingLongWrap> {
  private readonly _val: long;

  constructor(value: long) {
    this._val = value;
  }

  compareTo(other: ScopeComparableCompareToPart01TestMissingLongWrap): boolean {
    return this._val >= other._val;
  }
}

export class ScopeComparableCompareToPart01TestMissingStringWrap implements util.ScopeComparable<ScopeComparableCompareToPart01TestMissingStringWrap> {
  private readonly _val: string;

  constructor(value: string) {
    this._val = value;
  }

  compareTo(other: ScopeComparableCompareToPart01TestMissingStringWrap): boolean {
    return this._val >= other._val;
  }
}

export class ScopeComparableCompareToPart01TestMissingTemperature implements util.ScopeComparable<ScopeComparableCompareToPart01TestMissingTemperature> {
  private readonly _temp: int;

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(other: ScopeComparableCompareToPart01TestMissingTemperature): boolean {
    return this._temp >= other._temp;
  }
}

export class ScopeComparableCompareToPart02TestMissingBigBox {
  private readonly _value: bigint;

  constructor(value: bigint) {
    this._value = value;
  }

  compareTo(other: bigint): boolean {
    return this._value >= other;
  }

  getValue(): bigint {
    return this._value;
  }
}

export class ScopeComparableCompareToPart02TestMissingByteBox {
  private readonly _value: byte;

  constructor(value: byte) {
    this._value = value;
  }

  compareTo(other: byte): boolean {
    return this._value >= other;
  }

  getValue(): byte {
    return this._value;
  }
}

export class ScopeComparableCompareToPart02TestMissingCharBox {
  private readonly _value: char;

  constructor(value: char) {
    this._value = value;
  }

  compareTo(other: char): boolean {
    return this._value >= other;
  }

  getValue(): char {
    return this._value;
  }
}

export class ScopeComparableCompareToPart02TestMissingIntBox {
  private readonly _value: int;

  constructor(value: int) {
    this._value = value;
  }

  compareTo(other: int): boolean {
    return this._value >= other;
  }

  getValue(): int {
    return this._value;
  }
}

export class ScopeComparableCompareToPart02TestMissingLongBox {
  private readonly _value: long;

  constructor(value: long) {
    this._value = value;
  }

  compareTo(other: long): boolean {
    return this._value >= other;
  }

  getValue(): long {
    return this._value;
  }
}

export class ScopeComparableCompareToPart02TestMissingMass {
  private readonly _value: double;

  constructor(value: double) {
    this._value = value;
  }

  compareTo(other: double): boolean {
    return this._value >= other;
  }

  getValue(): double {
    return this._value;
  }
}

export class ScopeComparableCompareToPart02TestMissingTemperature implements util.ScopeComparable<ScopeComparableCompareToPart02TestMissingTemperature> {
  private readonly _temp: int;
  private readonly _unit: string = 'C';

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(other: ScopeComparableCompareToPart02TestMissingTemperature): boolean {
    return this._temp >= other.getTemp();
  }

  getTemp(): int {
    return this._temp;
  }

  getUnit(): string {
    return this._unit;
  }
}

export class ScopeComparableCompareToPart02TestMissingTimestamp {
  private readonly _date: Date;

  constructor(value: long) {
    this._date = new Date(1970, 0);
    this._date.setTime(value);
  }

  compareTo(other: Date): boolean {
    return this._date.getTime() >= other.getTime();
  }

  getDate(): Date {
    return this._date;
  }
}

export class ScopeComparableCompareToPart02TestMissingWord {
  private readonly _value: string;

  constructor(value: string) {
    this._value = value;
  }

  compareTo(other: string): boolean {
    return this._value >= other;
  }

  getValue(): string {
    return this._value;
  }
}

export class ScopeComparableCompareToPart03TestMissingByteVal implements util.ScopeComparable<ScopeComparableCompareToPart03TestMissingByteVal> {
  private readonly _b: byte;

  constructor(value: byte) {
    this._b = value;
  }

  compareTo(other: ScopeComparableCompareToPart03TestMissingByteVal): boolean {
    return this._b >= other._b;
  }

  getValue(): byte {
    return this._b;
  }
}

export class ScopeComparableCompareToPart03TestMissingCharVal implements util.ScopeComparable<ScopeComparableCompareToPart03TestMissingCharVal> {
  private readonly _c: char;

  constructor(value: char) {
    this._c = value;
  }

  compareTo(other: ScopeComparableCompareToPart03TestMissingCharVal): boolean {
    return this._c >= other._c;
  }

  getValue(): char {
    return this._c;
  }
}

export class ScopeComparableCompareToPart03TestMissingExplosive implements util.ScopeComparable<ScopeComparableCompareToPart03TestMissingExplosive> {
  private readonly _value: int;
  private readonly _boom: boolean;

  constructor(value: int, boom: boolean) {
    this._value = value;
    this._boom = boom;
  }

  getValue(): int {
    if (this._boom) {
      throw new Error('boom');
    }
    return this._value;
  }

  compareTo(other: ScopeComparableCompareToPart03TestMissingExplosive): boolean {
    let a: int = this.getValue();
    let b: int = other.getValue();
    return a >= b;
  }
}

export class ScopeComparableCompareToPart03TestMissingFlag {
  private readonly _on: boolean;

  constructor(value: boolean) {
    this._on = value;
  }

  compareTo(other: boolean): boolean {
    if (this._on === other) {
      return true;
    }
    return this._on === true;
  }
}

export class ScopeComparableCompareToPart03TestMissingFloatVal implements util.ScopeComparable<ScopeComparableCompareToPart03TestMissingFloatVal> {
  private readonly _f: float;

  constructor(value: float) {
    this._f = value;
  }

  compareTo(other: ScopeComparableCompareToPart03TestMissingFloatVal): boolean {
    return this._f >= other._f;
  }

  getValue(): float {
    return this._f;
  }
}

export class ScopeComparableCompareToPart03TestMissingGhostGrade implements util.ScopeComparable<ScopeComparableCompareToPart03TestMissingGhostGrade> {
  private readonly _score: int | undefined;

  constructor(value: int | undefined) {
    this._score = value;
  }

  compareTo(other: ScopeComparableCompareToPart03TestMissingGhostGrade): boolean {
    let a: int = this._score!;
    let b: int = other.getScore()!;
    return a >= b;
  }

  getScore(): int | undefined {
    return this._score;
  }
}

export class ScopeComparableCompareToPart03TestMissingGrade implements util.ScopeComparable<ScopeComparableCompareToPart03TestMissingGrade> {
  private readonly _score: int;

  constructor(value: int) {
    this._score = value;
  }

  compareTo(other: ScopeComparableCompareToPart03TestMissingGrade): boolean {
    return this._score >= other.getScore();
  }

  getScore(): int {
    return this._score;
  }
}

export class ScopeComparableCompareToPart03TestMissingMeter {
  private readonly _value: int;

  constructor(value: int) {
    this._value = value;
  }

  compareTo(other: int): boolean {
    return this._value >= other;
  }
}

export class ScopeComparableCompareToPart03TestMissingShortVal implements util.ScopeComparable<ScopeComparableCompareToPart03TestMissingShortVal> {
  private readonly _s: short;

  constructor(value: short) {
    this._s = value;
  }

  compareTo(other: ScopeComparableCompareToPart03TestMissingShortVal): boolean {
    return this._s >= other._s;
  }

  getValue(): short {
    return this._s;
  }
}

export class ScopeComparableCompareToPart03TestMissingTimestamp implements util.ScopeComparable<ScopeComparableCompareToPart03TestMissingTimestamp> {
  private readonly _date: Date;

  constructor(value: Date) {
    this._date = value;
  }

  compareTo(other: ScopeComparableCompareToPart03TestMissingTimestamp): boolean {
    return this._date.getTime() >= other.getTimeMs();
  }

  getTimeMs(): number {
    return this._date.getTime();
  }
}

export class ScopeComparableOverviewPart01TestMissingBooleanValue implements util.ScopeComparable<ScopeComparableOverviewPart01TestMissingBooleanValue> {
  private readonly _value: boolean;
  constructor(value: boolean) {
    this._value = value;
  }
  compareTo(value: ScopeComparableOverviewPart01TestMissingBooleanValue): boolean {
    return this._value === value.getValue();
  }
  getValue(): boolean {
    return this._value;
  }
}

export class ScopeComparableOverviewPart01TestMissingByteValue implements util.ScopeComparable<ScopeComparableOverviewPart01TestMissingByteValue> {
  private readonly _value: number;
  constructor(value: long) {
    this._value = value;
  }
  compareTo(value: ScopeComparableOverviewPart01TestMissingByteValue): boolean {
    return this._value >= value.getValue();
  }
  getValue(): number {
    return this._value;
  }
}

export class ScopeComparableOverviewPart01TestMissingDoubleTemperature implements util.ScopeComparable<ScopeComparableOverviewPart01TestMissingDoubleTemperature> {
  private readonly _temp: number;
  constructor(value: long) {
    this._temp = value;
  }
  compareTo(value: ScopeComparableOverviewPart01TestMissingDoubleTemperature): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): number {
    return this._temp;
  }
}

export class ScopeComparableOverviewPart01TestMissingLongTemperature implements util.ScopeComparable<ScopeComparableOverviewPart01TestMissingLongTemperature> {
  private readonly _temp: bigint;
  constructor(value: bigint) {
    this._temp = value;
  }
  compareTo(value: ScopeComparableOverviewPart01TestMissingLongTemperature): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): bigint {
    return this._temp;
  }
}

export class ScopeComparableOverviewPart01TestMissingObjValue implements util.ScopeComparable<ScopeComparableOverviewPart01TestMissingObjValue> {
  private readonly _value: int;
  constructor(value: int) {
    this._value = value;
  }
  compareTo(value: ScopeComparableOverviewPart01TestMissingObjValue): boolean {
    return this._value >= value.getValue();
  }
  getValue(): int {
    return this._value;
  }
}

export class ScopeComparableOverviewPart01TestMissingStringValue implements util.ScopeComparable<ScopeComparableOverviewPart01TestMissingStringValue> {
  private readonly _value: string;
  constructor(value: string) {
    this._value = value;
  }
  compareTo(value: ScopeComparableOverviewPart01TestMissingStringValue): boolean {
    return this._value >= value.getValue();
  }
  getValue(): string {
    return this._value;
  }
}

export class ScopeComparableOverviewPart01TestMissingTemperature implements util.ScopeComparable<ScopeComparableOverviewPart01TestMissingTemperature> {
  private readonly _temp: int;
  constructor(value: int) {
    this._temp = value;
  }
  compareTo(value: ScopeComparableOverviewPart01TestMissingTemperature): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): int {
    return this._temp;
  }
}

export class ScopeComparableOverviewPart02TestMissingName implements util.ScopeComparable<ScopeComparableOverviewPart02TestMissingName> {
  private readonly _value: string;

  constructor(value: string) {
    this._value = value;
  }

  compareTo(other: ScopeComparableOverviewPart02TestMissingName): boolean {
    return this._value >= other.getValue();
  }

  getValue(): string {
    return this._value;
  }
}

export class ScopeComparableOverviewPart02TestMissingProbe implements util.ScopeComparable<ScopeComparableOverviewPart02TestMissingProbe> {
  private readonly _value: int;
  private _callCount: int = 0;

  constructor(value: int) {
    this._value = value;
  }

  compareTo(other: ScopeComparableOverviewPart02TestMissingProbe): boolean {
    this._callCount = this._callCount + 1;
    return this._value >= other.getValue();
  }

  getValue(): int {
    return this._value;
  }

  getCallCount(): int {
    return this._callCount;
  }
}

export class ScopeComparableOverviewPart02TestMissingTemperature implements util.ScopeComparable<ScopeComparableOverviewPart02TestMissingTemperature> {
  private readonly _temp: int;

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(other: ScopeComparableOverviewPart02TestMissingTemperature): boolean {
    return this._temp >= other.getTemp();
  }

  getTemp(): int {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeComparableOverviewPart02TestMissingWeight implements util.ScopeComparable<ScopeComparableOverviewPart02TestMissingWeight> {
  private readonly _value: double;

  constructor(value: double) {
    this._value = value;
  }

  compareTo(other: ScopeComparableOverviewPart02TestMissingWeight): boolean {
    return this._value >= other.getValue();
  }

  getValue(): double {
    return this._value;
  }
}

export class ScopeHelperClampPart02TestMissingBigIntTemp implements util.ScopeComparable<ScopeHelperClampPart02TestMissingBigIntTemp> {
  private readonly _val: bigint;
  constructor(value: bigint) {
    this._val = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingBigIntTemp): boolean {
    
    return this._val >= other.getValue();
  }
  getValue(): bigint {
    return this._val;
  }
  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperClampPart02TestMissingBoolTemp implements util.ScopeComparable<ScopeHelperClampPart02TestMissingBoolTemp> {
  private readonly _val: boolean;
  constructor(value: boolean) {
    this._val = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingBoolTemp): boolean {
    if (this._val === other.getValue()) {
      return true;
    }
    if (this._val) {
      return true;
    }
    return false;
  }
  getValue(): boolean {
    return this._val;
  }
}

export class ScopeHelperClampPart02TestMissingByteTemp implements util.ScopeComparable<ScopeHelperClampPart02TestMissingByteTemp> {
  private readonly _val: byte;
  constructor(value: byte) {
    this._val = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingByteTemp): boolean {
    return this._val >= other.getVal();
  }
  getVal(): byte {
    return this._val;
  }
  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperClampPart02TestMissingCharTemp implements util.ScopeComparable<ScopeHelperClampPart02TestMissingCharTemp> {
  private readonly _val: char;
  constructor(value: char) {
    this._val = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingCharTemp): boolean {
    return this._val >= other.getVal();
  }
  getVal(): char {
    return this._val;
  }
  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperClampPart02TestMissingDateTemp implements util.ScopeComparable<ScopeHelperClampPart02TestMissingDateTemp> {
  private readonly _val: Date;
  constructor(value: Date) {
    this._val = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingDateTemp): boolean {
    let thisMs: number = this._val.getTime();
    let otherMs: number = other.getValue().getTime();
    
    return thisMs >= otherMs;
  }
  getValue(): Date {
    return this._val;
  }
  toString(): string {
    return this._val.getTime().toString();
  }
}

export class ScopeHelperClampPart02TestMissingDoubleTemp implements util.ScopeComparable<ScopeHelperClampPart02TestMissingDoubleTemp> {
  private readonly _val: double;
  constructor(value: double) {
    this._val = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingDoubleTemp): boolean {
    
    return this._val >= other.getVal();
  }
  getVal(): double {
    return this._val;
  }
  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperClampPart02TestMissingErrWrap implements util.ScopeComparable<ScopeHelperClampPart02TestMissingErrWrap> {
  private readonly _e: Error;
  constructor(value: Error) {
    this._e = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingErrWrap): boolean {
    return this._e.message.length >= other.getValue().message.length;
  }
  getValue(): Error {
    return this._e;
  }
  toString(): string {
    return this._e.message;
  }
}

export class ScopeHelperClampPart02TestMissingFloatTemp implements util.ScopeComparable<ScopeHelperClampPart02TestMissingFloatTemp> {
  private readonly _val: float;
  constructor(value: float) {
    this._val = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingFloatTemp): boolean {
    
    return this._val >= other.getVal();
  }
  getVal(): float {
    return this._val;
  }
  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperClampPart02TestMissingIntArr implements util.ScopeComparable<ScopeHelperClampPart02TestMissingIntArr> {
  private readonly _arr: int[];
  constructor(value: int[]) {
    this._arr = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingIntArr): boolean {
    return this._arr.length >= other.getArr().length;
  }
  getArr(): int[] {
    return this._arr;
  }
  toString(): string {
    return this._arr.length.toString();
  }
}

export class ScopeHelperClampPart02TestMissingLongTemp implements util.ScopeComparable<ScopeHelperClampPart02TestMissingLongTemp> {
  private readonly _val: long;
  constructor(value: long) {
    this._val = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingLongTemp): boolean {
    
    return this._val >= other.getVal();
  }
  getVal(): long {
    return this._val;
  }
  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperClampPart02TestMissingMapSize implements util.ScopeComparable<ScopeHelperClampPart02TestMissingMapSize> {
  private readonly _m: Map<string, int>;
  constructor(value: Map<string, int>) {
    this._m = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingMapSize): boolean {
    return this._m.size >= other.getValue().size;
  }
  getValue(): Map<string, int> {
    return this._m;
  }
  toString(): string {
    return this._m.size.toString();
  }
}

export class ScopeHelperClampPart02TestMissingPoint implements util.ScopeComparable<ScopeHelperClampPart02TestMissingPoint> {
  private readonly _x: int;
  constructor(value: int) {
    this._x = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingPoint): boolean {
    return this._x >= other.getX();
  }
  getX(): int {
    return this._x;
  }
  toString(): string {
    return this._x.toString();
  }
}

export class ScopeHelperClampPart02TestMissingRegexWrap implements util.ScopeComparable<ScopeHelperClampPart02TestMissingRegexWrap> {
  private readonly _r: RegExp;
  constructor(value: RegExp) {
    this._r = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingRegexWrap): boolean {
    return this._r.source.length >= other.getValue().source.length;
  }
  getValue(): RegExp {
    return this._r;
  }
  toString(): string {
    return this._r.source;
  }
}

export class ScopeHelperClampPart02TestMissingSetSize implements util.ScopeComparable<ScopeHelperClampPart02TestMissingSetSize> {
  private readonly _s: Set<int>;
  constructor(value: Set<int>) {
    this._s = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingSetSize): boolean {
    return this._s.size >= other.getValue().size;
  }
  getValue(): Set<int> {
    return this._s;
  }
  toString(): string {
    return this._s.size.toString();
  }
}

export class ScopeHelperClampPart02TestMissingShortTemp implements util.ScopeComparable<ScopeHelperClampPart02TestMissingShortTemp> {
  private readonly _val: short;
  constructor(value: short) {
    this._val = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingShortTemp): boolean {
    return this._val >= other.getVal();
  }
  getVal(): short {
    return this._val;
  }
  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperClampPart02TestMissingStringTemp implements util.ScopeComparable<ScopeHelperClampPart02TestMissingStringTemp> {
  private readonly _val: string;
  constructor(value: string) {
    this._val = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingStringTemp): boolean {
    
    return this._val >= other.getValue();
  }
  getValue(): string {
    return this._val;
  }
  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperClampPart02TestMissingU8Wrap implements util.ScopeComparable<ScopeHelperClampPart02TestMissingU8Wrap> {
  private readonly _u: Uint8Array;
  constructor(value: Uint8Array) {
    this._u = value;
  }
  compareTo(other: ScopeHelperClampPart02TestMissingU8Wrap): boolean {
    return this._u.byteLength >= other.getValue().byteLength;
  }
  getValue(): Uint8Array {
    return this._u;
  }
  toString(): string {
    return this._u.byteLength.toString();
  }
}

export class ScopeHelperClampPart03TestMissingBigIntWrap implements util.ScopeComparable<ScopeHelperClampPart03TestMissingBigIntWrap> {
  private _val: bigint = 0n;

  constructor(value: bigint) {
    this._val = value;
  }

  compareTo(value: ScopeHelperClampPart03TestMissingBigIntWrap): boolean {
    return this._val >= value.getVal();
  }

  getVal(): bigint {
    return this._val;
  }

  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperClampPart03TestMissingCountTemp implements util.ScopeComparable<ScopeHelperClampPart03TestMissingCountTemp> {
  private _temp: int = 0;

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(value: ScopeHelperClampPart03TestMissingCountTemp): boolean {
    
    return this._temp >= value.getTemp();
  }

  getTemp(): int {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperClampPart03TestMissingDoubleWrap implements util.ScopeComparable<ScopeHelperClampPart03TestMissingDoubleWrap> {
  private _val: double = 0;

  constructor(value: double) {
    this._val = value;
  }

  compareTo(value: ScopeHelperClampPart03TestMissingDoubleWrap): boolean {
    return this._val >= value.getVal();
  }

  getVal(): double {
    return this._val;
  }

  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperClampPart03TestMissingEqualityTemp implements util.ScopeComparable<ScopeHelperClampPart03TestMissingEqualityTemp> {
  private _temp: int = 0;

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(value: ScopeHelperClampPart03TestMissingEqualityTemp): boolean {
    return this._temp === value.getTemp();
  }

  getTemp(): int {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperClampPart03TestMissingLenWrap implements util.ScopeComparable<ScopeHelperClampPart03TestMissingLenWrap> {
  private _val: string = '';

  constructor(value: string) {
    this._val = value;
  }

  compareTo(value: ScopeHelperClampPart03TestMissingLenWrap): boolean {
    return this._val.length >= value.getVal().length;
  }

  getVal(): string {
    return this._val;
  }

  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperClampPart03TestMissingNullTemp implements util.ScopeComparable<ScopeHelperClampPart03TestMissingNullTemp> {
  private _temp: int | null = 0;

  constructor(value: int | null) {
    this._temp = value;
  }

  compareTo(value: ScopeHelperClampPart03TestMissingNullTemp): boolean {
    let a: int | null = this._temp;
    let b: int | null = value.getTemp();
    if (a === null || b === null) {
      return false;
    }
    return a >= b;
  }

  getTemp(): int | null {
    return this._temp;
  }

  toString(): string {
    let temp: int | null = this._temp;
    if (temp === null) {
      return 'null';
    }
    return temp.toString();
  }
}

export class ScopeHelperClampPart03TestMissingShortWrap implements util.ScopeComparable<ScopeHelperClampPart03TestMissingShortWrap> {
  private _val: short = 0;

  constructor(value: short) {
    this._val = value;
  }

  compareTo(value: ScopeHelperClampPart03TestMissingShortWrap): boolean {
    return this._val >= value.getVal();
  }

  getVal(): short {
    return this._val;
  }

  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperClampPart03TestMissingTemperature implements util.ScopeComparable<ScopeHelperClampPart03TestMissingTemperature> {
  private _temp: int = 0;

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(value: ScopeHelperClampPart03TestMissingTemperature): boolean {
    return this._temp >= value.getTemp();
  }

  getTemp(): int {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperClampPart03TestMissingThrowOnLowerTemp implements util.ScopeComparable<ScopeHelperClampPart03TestMissingThrowOnLowerTemp> {
  private _temp: int = 0;

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(value: ScopeHelperClampPart03TestMissingThrowOnLowerTemp): boolean {
    if (value.getTemp() === 30) {
      throw new Error('compare lower fails');
    }
    return this._temp >= value.getTemp();
  }

  getTemp(): int {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperClampPart03TestMissingThrowOnValueTemp implements util.ScopeComparable<ScopeHelperClampPart03TestMissingThrowOnValueTemp> {
  private _temp: int = 0;

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(value: ScopeHelperClampPart03TestMissingThrowOnValueTemp): boolean {
    if (value.getTemp() === 35) {
      throw new Error('compare value fails');
    }
    return this._temp >= value.getTemp();
  }

  getTemp(): int {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperClampPart03TestMissingThrowingTemp implements util.ScopeComparable<ScopeHelperClampPart03TestMissingThrowingTemp> {
  private _temp: int = 0;

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(value: ScopeHelperClampPart03TestMissingThrowingTemp): boolean {
    throw new Error('compareTo throws');
  }

  getTemp(): int {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperConstructorPart03TestMissingBigValueT3 implements util.ScopeComparable<ScopeHelperConstructorPart03TestMissingBigValueT3> {
  private readonly _val: long;

  constructor(value: long) {
    this._val = value;
  }

  compareTo(value: ScopeHelperConstructorPart03TestMissingBigValueT3): boolean {
    return this._val >= value.getVal();
  }

  getVal(): long {
    return this._val;
  }

  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperConstructorPart03TestMissingBoolWrapT3 implements util.ScopeComparable<ScopeHelperConstructorPart03TestMissingBoolWrapT3> {
  private readonly _val: boolean;

  constructor(value: boolean) {
    this._val = value;
  }

  compareTo(value: ScopeHelperConstructorPart03TestMissingBoolWrapT3): boolean {
    return this._val === value.getVal();
  }

  getVal(): boolean {
    return this._val;
  }

  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperConstructorPart03TestMissingCarT3 {
  model: string = 'sedan';
}

export class ScopeHelperConstructorPart03TestMissingCharWrapT3 implements util.ScopeComparable<ScopeHelperConstructorPart03TestMissingCharWrapT3> {
  private readonly _val: char;

  constructor(value: char) {
    this._val = value;
  }

  compareTo(value: ScopeHelperConstructorPart03TestMissingCharWrapT3): boolean {
    return this._val >= value.getVal();
  }

  getVal(): char {
    return this._val;
  }

  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperConstructorPart03TestMissingDateWrapT3 implements util.ScopeComparable<ScopeHelperConstructorPart03TestMissingDateWrapT3> {
  private readonly _d: Date;

  constructor(value: Date) {
    this._d = value;
  }

  compareTo(value: ScopeHelperConstructorPart03TestMissingDateWrapT3): boolean {
    return this._d.getTime() >= value.getD().getTime();
  }

  getD(): Date {
    return this._d;
  }

  toString(): string {
    return this._d.getTime().toString();
  }
}

export class ScopeHelperConstructorPart03TestMissingDoubleWrapT3 implements util.ScopeComparable<ScopeHelperConstructorPart03TestMissingDoubleWrapT3> {
  private readonly _val: double;

  constructor(value: double) {
    this._val = value;
  }

  compareTo(value: ScopeHelperConstructorPart03TestMissingDoubleWrapT3): boolean {
    return this._val >= value.getVal();
  }

  getVal(): double {
    return this._val;
  }

  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperConstructorPart03TestMissingHolderT3 {
  tag: int = 1;
}

export class ScopeHelperConstructorPart03TestMissingThrowingT3 implements util.ScopeComparable<ScopeHelperConstructorPart03TestMissingThrowingT3> {
  private readonly _temp: int;

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(value: ScopeHelperConstructorPart03TestMissingThrowingT3): boolean {
    throw new Error('compareTo boom');
  }

  getTemp(): int {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperContainsPart03TestMissingLevelItem implements util.ScopeComparable<ScopeHelperContainsPart03TestMissingLevelItem> {
  private _level: int;

  constructor(value: int) {
    this._level = value;
  }

  compareTo(value: ScopeHelperContainsPart03TestMissingLevelItem): boolean {
    return this._level >= value.getLevel();
  }

  getLevel(): int {
    return this._level;
  }

  toString(): string {
    return this._level.toString();
  }
}

export class ScopeHelperContainsPart03TestMissingTemperature implements util.ScopeComparable<ScopeHelperContainsPart03TestMissingTemperature> {
  private _temp: int;

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(value: ScopeHelperContainsPart03TestMissingTemperature): boolean {
    return this._temp >= value.getTemp();
  }

  getTemp(): int {
    return this._temp;
  }

  setTemp(value: int): void {
    this._temp = value;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperExpandPart01TestMissingBooleanTemp implements util.ScopeComparable<ScopeHelperExpandPart01TestMissingBooleanTemp> {
  private _val: boolean;
  constructor(value: boolean) {
    this._val = value;
  }
  compareTo(other: ScopeHelperExpandPart01TestMissingBooleanTemp): boolean {
    if (this._val === other.getVal()) {
      return true;
    }
    if (!this._val) {
      return false;
    }
    return true;
  }
  getVal(): boolean {
    return this._val;
  }
  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperExpandPart01TestMissingStringTemp implements util.ScopeComparable<ScopeHelperExpandPart01TestMissingStringTemp> {
  private _val: string;
  constructor(value: string) {
    this._val = value;
  }
  compareTo(other: ScopeHelperExpandPart01TestMissingStringTemp): boolean {
    return this._val >= other.getVal();
  }
  getVal(): string {
    return this._val;
  }
  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperExpandPart01TestMissingTemperature implements util.ScopeComparable<ScopeHelperExpandPart01TestMissingTemperature> {
  private _temp: int;
  constructor(value: int) {
    this._temp = value;
  }
  compareTo(other: ScopeHelperExpandPart01TestMissingTemperature): boolean {
    return this._temp >= other.getTemp();
  }
  getTemp(): int {
    return this._temp;
  }
  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingAlwaysTrue implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingAlwaysTrue> {
  private readonly _n: int;
  constructor(value: int) {
    this._n = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingAlwaysTrue): boolean {
    return true;
  }
  getN(): int {
    return this._n;
  }
  toString(): string {
    return this._n.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingBigBalance implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingBigBalance> {
  private readonly _bal: bigint;
  constructor(value: bigint) {
    this._bal = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingBigBalance): boolean {
    return this._bal >= value.getBal();
  }
  getBal(): bigint {
    return this._bal;
  }
  toString(): string {
    return this._bal.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingCode implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingCode> {
  private readonly _c: char;
  constructor(value: char) {
    this._c = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingCode): boolean {
    return this._c >= value.getC();
  }
  getC(): char {
    return this._c;
  }
  toString(): string {
    return this._c.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingDateWrap implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingDateWrap> {
  private readonly _date: Date;
  constructor(value: Date) {
    this._date = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingDateWrap): boolean {
    return this._date.getTime() >= value.getDate().getTime();
  }
  getDate(): Date {
    return this._date;
  }
  toString(): string {
    return this._date.getTime().toString();
  }
}

export class ScopeHelperExpandPart03TestMissingDirComp implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingDirComp> {
  static reversed: boolean = false;
  private readonly _n: int;
  constructor(value: int) {
    this._n = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingDirComp): boolean {
    if (ScopeHelperExpandPart03TestMissingDirComp.reversed) {
      return this._n <= value.getN();
    }
    return this._n >= value.getN();
  }
  getN(): int {
    return this._n;
  }
  toString(): string {
    return this._n.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingFlag implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingFlag> {
  private readonly _flag: boolean;
  constructor(value: boolean) {
    this._flag = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingFlag): boolean {
    if (this._flag === value.getFlag()) {
      return true;
    }
    return this._flag;
  }
  getFlag(): boolean {
    return this._flag;
  }
  toString(): string {
    return this._flag.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingHeight implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingHeight> {
  private readonly _h: short;
  constructor(value: short) {
    this._h = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingHeight): boolean {
    return this._h >= value.getH();
  }
  getH(): short {
    return this._h;
  }
  toString(): string {
    return this._h.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingLength implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingLength> {
  private readonly _len: long;
  constructor(value: long) {
    this._len = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingLength): boolean {
    return this._len >= value.getLen();
  }
  getLen(): long {
    return this._len;
  }
  toString(): string {
    return this._len.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingListLen implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingListLen> {
  private readonly _arr: long[];
  constructor(value: long[]) {
    this._arr = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingListLen): boolean {
    return this._arr.length >= value.getArr().length;
  }
  getArr(): long[] {
    return this._arr;
  }
  toString(): string {
    return this._arr.length.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingMapSize implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingMapSize> {
  private readonly _map: Map<string, int>;
  constructor(value: Map<string, int>) {
    this._map = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingMapSize): boolean {
    return this._map.size >= value.getMap().size;
  }
  getMap(): Map<string, int> {
    return this._map;
  }
  toString(): string {
    return this._map.size.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingMeasure implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingMeasure> {
  private readonly _m: float;
  constructor(value: float) {
    this._m = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingMeasure): boolean {
    return this._m >= value.getM();
  }
  getM(): float {
    return this._m;
  }
  toString(): string {
    return this._m.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingNeverBigger implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingNeverBigger> {
  private readonly _n: int;
  constructor(value: int) {
    this._n = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingNeverBigger): boolean {
    return false;
  }
  getN(): int {
    return this._n;
  }
  toString(): string {
    return this._n.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingScore implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingScore> {
  private readonly _score: double;
  constructor(value: double) {
    this._score = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingScore): boolean {
    return this._score >= value.getScore();
  }
  getScore(): double {
    return this._score;
  }
  toString(): string {
    return this._score.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingTemperature implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingTemperature> {
  private readonly _temp: int;
  constructor(value: int) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingTemperature): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): int {
    return this._temp;
  }
  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingThrowingComp implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingThrowingComp> {
  private readonly _n: int;
  constructor(value: int) {
    this._n = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingThrowingComp): boolean {
    throw new Error('compare failed');
  }
  getN(): int {
    return this._n;
  }
  toString(): string {
    return this._n.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingWeight implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingWeight> {
  private readonly _w: byte;
  constructor(value: byte) {
    this._w = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingWeight): boolean {
    return this._w >= value.getW();
  }
  getW(): byte {
    return this._w;
  }
  toString(): string {
    return this._w.toString();
  }
}

export class ScopeHelperExpandPart03TestMissingWord implements util.ScopeComparable<ScopeHelperExpandPart03TestMissingWord> {
  private readonly _word: string;
  constructor(value: string) {
    this._word = value;
  }
  compareTo(value: ScopeHelperExpandPart03TestMissingWord): boolean {
    return this._word.length >= value.getWord().length;
  }
  getWord(): string {
    return this._word;
  }
  toString(): string {
    return this._word;
  }
}

export class ScopeHelperGetUpperPart02TestMissingArrValue implements util.ScopeComparable<ScopeHelperGetUpperPart02TestMissingArrValue> {
  private _a: long[] = [];
  constructor(value: long[]) {
    this._a = value;
  }
  compareTo(value: ScopeHelperGetUpperPart02TestMissingArrValue): boolean {
    return this._a.length >= value.getA().length;
  }
  getA(): long[] {
    return this._a;
  }
  toString(): string {
    return this._a.length.toString();
  }
}

export class ScopeHelperGetUpperPart02TestMissingBigIntValue implements util.ScopeComparable<ScopeHelperGetUpperPart02TestMissingBigIntValue> {
  private _n: bigint = 0n;
  constructor(value: bigint) {
    this._n = value;
  }
  compareTo(value: ScopeHelperGetUpperPart02TestMissingBigIntValue): boolean {
    return this._n >= value.getN();
  }
  getN(): bigint {
    return this._n;
  }
  toString(): string {
    return this._n.toString();
  }
}

export class ScopeHelperGetUpperPart02TestMissingBoolValue implements util.ScopeComparable<ScopeHelperGetUpperPart02TestMissingBoolValue> {
  private _b: boolean = false;
  constructor(value: boolean) {
    this._b = value;
  }
  compareTo(value: ScopeHelperGetUpperPart02TestMissingBoolValue): boolean {
    return this._b >= value.getB();
  }
  getB(): boolean {
    return this._b;
  }
  toString(): string {
    return this._b.toString();
  }
}

export class ScopeHelperGetUpperPart02TestMissingCharValue implements util.ScopeComparable<ScopeHelperGetUpperPart02TestMissingCharValue> {
  private _c: string = '';
  constructor(value: string) {
    this._c = value;
  }
  compareTo(value: ScopeHelperGetUpperPart02TestMissingCharValue): boolean {
    return this._c >= value.getC();
  }
  getC(): string {
    return this._c;
  }
  toString(): string {
    return this._c;
  }
}

export class ScopeHelperGetUpperPart02TestMissingDateValue implements util.ScopeComparable<ScopeHelperGetUpperPart02TestMissingDateValue> {
  private _t: long = 0;
  constructor(value: long) {
    this._t = value;
  }
  compareTo(value: ScopeHelperGetUpperPart02TestMissingDateValue): boolean {
    return this._t >= value.getT();
  }
  getT(): long {
    return this._t;
  }
  getDate(): Date {
    return Utils.dateFromTime(this._t);
  }
  toString(): string {
    return this._t.toString();
  }
}

export class ScopeHelperGetUpperPart02TestMissingDoubleValue implements util.ScopeComparable<ScopeHelperGetUpperPart02TestMissingDoubleValue> {
  private _d: double = 0;
  constructor(value: double) {
    this._d = value;
  }
  compareTo(value: ScopeHelperGetUpperPart02TestMissingDoubleValue): boolean {
    return this._d >= value.getD();
  }
  getD(): double {
    return this._d;
  }
  toString(): string {
    return this._d.toString();
  }
}

export class ScopeHelperGetUpperPart02TestMissingErrorValue implements util.ScopeComparable<ScopeHelperGetUpperPart02TestMissingErrorValue> {
  private _e: Error = new Error();
  constructor(value: Error) {
    this._e = value;
  }
  compareTo(value: ScopeHelperGetUpperPart02TestMissingErrorValue): boolean {
    return this._e.message >= value.getE().message;
  }
  getE(): Error {
    return this._e;
  }
  toString(): string {
    return this._e.message;
  }
}

export class ScopeHelperGetUpperPart02TestMissingFloatValue implements util.ScopeComparable<ScopeHelperGetUpperPart02TestMissingFloatValue> {
  private _f: float = 0;
  constructor(value: float) {
    this._f = value;
  }
  compareTo(value: ScopeHelperGetUpperPart02TestMissingFloatValue): boolean {
    return this._f >= value.getF();
  }
  getF(): float {
    return this._f;
  }
  toString(): string {
    return this._f.toString();
  }
}

export class ScopeHelperGetUpperPart02TestMissingLongValue implements util.ScopeComparable<ScopeHelperGetUpperPart02TestMissingLongValue> {
  private _l: long = 0;
  constructor(value: long) {
    this._l = value;
  }
  compareTo(value: ScopeHelperGetUpperPart02TestMissingLongValue): boolean {
    return this._l >= value.getL();
  }
  getL(): long {
    return this._l;
  }
  toString(): string {
    return this._l.toString();
  }
}

export class ScopeHelperGetUpperPart02TestMissingMapValue implements util.ScopeComparable<ScopeHelperGetUpperPart02TestMissingMapValue> {
  private _m: Map<string, number> = new Map<string, number>();
  constructor(value: Map<string, number>) {
    this._m = value;
  }
  compareTo(value: ScopeHelperGetUpperPart02TestMissingMapValue): boolean {
    return this._m.size >= value.getM().size;
  }
  getM(): Map<string, number> {
    return this._m;
  }
  toString(): string {
    return this._m.size.toString();
  }
}

export class ScopeHelperGetUpperPart02TestMissingNumberValue implements util.ScopeComparable<ScopeHelperGetUpperPart02TestMissingNumberValue> {
  private _nv: number = 0;
  constructor(value: long) {
    this._nv = value;
  }
  compareTo(value: ScopeHelperGetUpperPart02TestMissingNumberValue): boolean {
    return this._nv >= value.getNv();
  }
  getNv(): number {
    return this._nv;
  }
  toString(): string {
    return this._nv.toString();
  }
}

export class ScopeHelperGetUpperPart02TestMissingRegexValue implements util.ScopeComparable<ScopeHelperGetUpperPart02TestMissingRegexValue> {
  private _r: RegExp = new RegExp('');
  constructor(value: RegExp) {
    this._r = value;
  }
  compareTo(value: ScopeHelperGetUpperPart02TestMissingRegexValue): boolean {
    return this._r.source >= value.getR().source;
  }
  getR(): RegExp {
    return this._r;
  }
  toString(): string {
    return this._r.source;
  }
}

export class ScopeHelperGetUpperPart02TestMissingStringValue implements util.ScopeComparable<ScopeHelperGetUpperPart02TestMissingStringValue> {
  private _s: string = '';
  constructor(value: string) {
    this._s = value;
  }
  compareTo(value: ScopeHelperGetUpperPart02TestMissingStringValue): boolean {
    return this._s >= value.getS();
  }
  getS(): string {
    return this._s;
  }
  toString(): string {
    return this._s;
  }
}

export class ScopeHelperGetUpperPart02TestMissingTemperature implements util.ScopeComparable<ScopeHelperGetUpperPart02TestMissingTemperature> {
  private _temp: int = 0;
  constructor(value: int) {
    this._temp = value;
  }
  compareTo(value: ScopeHelperGetUpperPart02TestMissingTemperature): boolean {
    return this._temp >= value.getTemp();
  }
  getTemp(): int {
    return this._temp;
  }
  setTemp(value: int): void {
    this._temp = value;
  }
  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperIntersectPart03TestMissingLongWrap implements util.ScopeComparable<ScopeHelperIntersectPart03TestMissingLongWrap> {
  private _val: long = 0;

  constructor(value: long) {
    this._val = value;
  }

  compareTo(value: ScopeHelperIntersectPart03TestMissingLongWrap): boolean {
    return this._val >= value.getVal();
  }

  getVal(): long {
    return this._val;
  }

  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperIntersectPart03TestMissingStrWrap implements util.ScopeComparable<ScopeHelperIntersectPart03TestMissingStrWrap> {
  private _val: string = '';

  constructor(value: string) {
    this._val = value;
  }

  compareTo(value: ScopeHelperIntersectPart03TestMissingStrWrap): boolean {
    return this._val >= value.getVal();
  }

  getVal(): string {
    return this._val;
  }

  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperIntersectPart03TestMissingTemperature implements util.ScopeComparable<ScopeHelperIntersectPart03TestMissingTemperature> {
  private _temp: int = 0;

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(value: ScopeHelperIntersectPart03TestMissingTemperature): boolean {
    return this._temp >= value.getTemp();
  }

  getTemp(): int {
    return this._temp;
  }

  setTemp(value: int): void {
    this._temp = value;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperOverviewPart01TestMissingTemperature implements util.ScopeComparable<ScopeHelperOverviewPart01TestMissingTemperature> {
  private readonly _temp: int;
  readonly scale: string = 'C';

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(value: ScopeHelperOverviewPart01TestMissingTemperature): boolean {
    return this._temp >= value.getTemp();
  }

  getTemp(): int {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperOverviewPart03TestMissingAllFalseTemp implements util.ScopeComparable<ScopeHelperOverviewPart03TestMissingAllFalseTemp> {
  private readonly _temp: int;

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(value: ScopeHelperOverviewPart03TestMissingAllFalseTemp): boolean {
    return false;
  }

  getTemp(): int {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperOverviewPart03TestMissingTemperature implements util.ScopeComparable<ScopeHelperOverviewPart03TestMissingTemperature> {
  private readonly _temp: int;

  constructor(value: int) {
    this._temp = value;
  }

  compareTo(value: ScopeHelperOverviewPart03TestMissingTemperature): boolean {
    return this._temp >= value.getTemp();
  }

  getTemp(): int {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}

export class ScopeHelperToStringPart01TestMissingHeight implements util.ScopeComparable<ScopeHelperToStringPart01TestMissingHeight> {
  private readonly _length: double;

  constructor(value: double) {
    this._length = value;
  }

  compareTo(value: ScopeHelperToStringPart01TestMissingHeight): boolean {
    return this._length >= value.getLength();
  }

  getLength(): double {
    return this._length;
  }

  toString(): string {
    return this._length.toString();
  }
}

export class ScopeHelperToStringPart01TestMissingLabel implements util.ScopeComparable<ScopeHelperToStringPart01TestMissingLabel> {
  private readonly _tag: string;

  constructor(value: string) {
    this._tag = value;
  }

  compareTo(value: ScopeHelperToStringPart01TestMissingLabel): boolean {
    return this._tag.length >= value.getTag().length;
  }

  getTag(): string {
    return this._tag;
  }

  toString(): string {
    return this._tag;
  }
}

export class ScopeHelperToStringPart01TestMissingMeter implements util.ScopeComparable<ScopeHelperToStringPart01TestMissingMeter> {
  private readonly _meters: bigint;

  constructor(value: bigint) {
    this._meters = value;
  }

  compareTo(value: ScopeHelperToStringPart01TestMissingMeter): boolean {
    return this._meters >= value.getMeters();
  }

  getMeters(): bigint {
    return this._meters;
  }

  toString(): string {
    return this._meters.toString() + 'm';
  }
}

export class ScopeHelperToStringPart02TestMissingCoin implements util.ScopeComparable<ScopeHelperToStringPart02TestMissingCoin> {
  private readonly _cents: long;

  constructor(value: long) {
    this._cents = value;
  }

  compareTo(value: ScopeHelperToStringPart02TestMissingCoin): boolean {
    return this._cents >= value.getCents();
  }

  getCents(): long {
    return this._cents;
  }

  toString(): string {
    return this._cents.toString();
  }
}

export class ScopeHelperToStringPart02TestMissingGrade implements util.ScopeComparable<ScopeHelperToStringPart02TestMissingGrade> {
  private readonly _score: float;

  constructor(value: float) {
    this._score = value;
  }

  compareTo(value: ScopeHelperToStringPart02TestMissingGrade): boolean {
    return this._score >= value.getScore();
  }

  getScore(): float {
    return this._score;
  }

  toString(): string {
    return this._score.toString() + 'f';
  }
}

export class ScopeHelperToStringPart02TestMissingInterval implements util.ScopeComparable<ScopeHelperToStringPart02TestMissingInterval> {
  private readonly _sec: short;

  constructor(value: short) {
    this._sec = value;
  }

  compareTo(value: ScopeHelperToStringPart02TestMissingInterval): boolean {
    return this._sec >= value.getSec();
  }

  getSec(): short {
    return this._sec;
  }

  toString(): string {
    return this._sec.toString() + 's';
  }
}

export class ScopeHelperToStringPart02TestMissingLetter implements util.ScopeComparable<ScopeHelperToStringPart02TestMissingLetter> {
  private readonly _ch: char;

  constructor(value: char) {
    this._ch = value;
  }

  compareTo(value: ScopeHelperToStringPart02TestMissingLetter): boolean {
    return this._ch >= value.getCh();
  }

  getCh(): char {
    return this._ch;
  }

  toString(): string {
    return this._ch.toString();
  }
}

export class ScopeHelperToStringPart02TestMissingPixels implements util.ScopeComparable<ScopeHelperToStringPart02TestMissingPixels> {
  private readonly _pix: byte;

  constructor(value: byte) {
    this._pix = value;
  }

  compareTo(value: ScopeHelperToStringPart02TestMissingPixels): boolean {
    return this._pix >= value.getPix();
  }

  getPix(): byte {
    return this._pix;
  }

  toString(): string {
    return this._pix.toString() + 'px';
  }
}

export class ScopeHelperToStringPart02TestMissingSwitch implements util.ScopeComparable<ScopeHelperToStringPart02TestMissingSwitch> {
  private readonly _on: boolean;

  constructor(value: boolean) {
    this._on = value;
  }

  compareTo(value: ScopeHelperToStringPart02TestMissingSwitch): boolean {
    return this._on === value.getOn();
  }

  getOn(): boolean {
    return this._on;
  }

  toString(): string {
    if (this._on) {
      return 'ON';
    }
    return 'OFF';
  }
}

export class ScopeHelperToStringPart02TestMissingVolume implements util.ScopeComparable<ScopeHelperToStringPart02TestMissingVolume> {
  private readonly _val: int;

  constructor(value: int) {
    this._val = value;
  }

  compareTo(value: ScopeHelperToStringPart02TestMissingVolume): boolean {
    return this._val >= value.getVal();
  }

  getVal(): int {
    return this._val;
  }

  toString(): string {
    return this._val.toString();
  }
}

export class ScopeHelperToStringPart02TestMissingWeight implements util.ScopeComparable<ScopeHelperToStringPart02TestMissingWeight> {
  private readonly _kg: double;

  constructor(value: double) {
    this._kg = value;
  }

  compareTo(value: ScopeHelperToStringPart02TestMissingWeight): boolean {
    return this._kg >= value.getKg();
  }

  getKg(): double {
    return this._kg;
  }

  toString(): string {
    return this._kg.toString() + 'g';
  }
}

export class ScopeHelperToStringPart02TestMissingWord implements util.ScopeComparable<ScopeHelperToStringPart02TestMissingWord> {
  private readonly _text: string;

  constructor(value: string) {
    this._text = value;
  }

  compareTo(value: ScopeHelperToStringPart02TestMissingWord): boolean {
    return this._text.length >= value.getText().length;
  }

  getText(): string {
    return this._text;
  }

  toString(): string {
    return this._text;
  }
}

export class Temperature implements util.ScopeComparable<Temperature> {
  private readonly value: int;
  constructor(value: int) {
    this.value = value;
  }
  compareTo(other: Temperature): boolean {
    return this.value >= other.value;
  }
  getTemp(): int {
    return this.value;
  }
  toString(): string {
    return this.value.toString();
  }
}

export class IntWrapT3 implements util.ScopeComparable<IntWrapT3> {
  private readonly value: int;
  constructor(value: int) {
    this.value = value;
  }
  compareTo(other: IntWrapT3): boolean {
    return this.value >= other.value;
  }
  getVal(): int {
    return this.value;
  }
  toString(): string {
    return this.value.toString();
  }
}

export class Person implements util.ScopeComparable<Person> {
  readonly name: string;
  readonly age: int;
  constructor(name: string, age: int) {
    this.name = name;
    this.age = age;
  }
  compareTo(other: Person): boolean {
    return this.age >= other.age;
  }
  toString(): string {
    return this.name;
  }
}

export function probeScopeCtor03(input: Object): int {
        try {
          let r = new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            input as ScopeHelperOverviewPart03TestMissingTemperature,
            new ScopeHelperOverviewPart03TestMissingTemperature(10),
          );
          if (r === null) {
            return 1;
          }
          return 0;
        } catch (e) {
          return 1;
        }
      }

export function probeScopeCtorPair03(lower: Object, upper: Object): int {
        try {
          let r = new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            lower as ScopeHelperOverviewPart03TestMissingTemperature,
            upper as ScopeHelperOverviewPart03TestMissingTemperature,
          );
          if (r === null) {
            return 1;
          }
          return 0;
        } catch (e) {
          return 1;
        }
      }

export function useDecoder(dec: util.StringDecoder): string {
        return dec.write(new Uint8Array([0x43]));
      }

export class ScopeHelperIntValue implements util.ScopeComparable<ScopeHelperIntValue> {
  readonly value: int;
  constructor(value: int) {
    this.value = value;
  }
  compareTo(other: ScopeHelperIntValue): boolean {
    return this.value >= other.value;
  }
  getValue(): int {
    return this.value;
  }
  toString(): string {
    return this.value.toString();
  }
}

export class ScopeHelperLongValue implements util.ScopeComparable<ScopeHelperLongValue> {
  readonly value: long;
  constructor(value: long) {
    this.value = value;
  }
  compareTo(other: ScopeHelperLongValue): boolean {
    return this.value >= other.value;
  }
  getValue(): long {
    return this.value;
  }
  toString(): string {
    return this.value.toString();
  }
}

export class ScopeHelperDoubleValue implements util.ScopeComparable<ScopeHelperDoubleValue> {
  readonly value: double;
  constructor(value: double) {
    this.value = value;
  }
  compareTo(other: ScopeHelperDoubleValue): boolean {
    return this.value >= other.value;
  }
  getValue(): double {
    return this.value;
  }
  toString(): string {
    return this.value.toString();
  }
}

export class ScopeHelperFloatValue implements util.ScopeComparable<ScopeHelperFloatValue> {
  readonly value: float;
  constructor(value: float) {
    this.value = value;
  }
  compareTo(other: ScopeHelperFloatValue): boolean {
    return this.value >= other.value;
  }
  getValue(): float {
    return this.value;
  }
  toString(): string {
    return this.value.toString();
  }
}

export class ScopeHelperByteValue implements util.ScopeComparable<ScopeHelperByteValue> {
  readonly value: byte;
  constructor(value: byte) {
    this.value = value;
  }
  compareTo(other: ScopeHelperByteValue): boolean {
    return this.value >= other.value;
  }
  getValue(): byte {
    return this.value;
  }
  toString(): string {
    return this.value.toString();
  }
}

export class ScopeHelperShortValue implements util.ScopeComparable<ScopeHelperShortValue> {
  readonly value: short;
  constructor(value: short) {
    this.value = value;
  }
  compareTo(other: ScopeHelperShortValue): boolean {
    return this.value >= other.value;
  }
  getValue(): short {
    return this.value;
  }
  toString(): string {
    return this.value.toString();
  }
}

export class ScopeHelperCharValue implements util.ScopeComparable<ScopeHelperCharValue> {
  readonly value: char;
  constructor(value: char) {
    this.value = value;
  }
  compareTo(other: ScopeHelperCharValue): boolean {
    return this.value >= other.value;
  }
  getValue(): char {
    return this.value;
  }
  toString(): string {
    return this.value.toString();
  }
}

export class ScopeHelperStringValue implements util.ScopeComparable<ScopeHelperStringValue> {
  readonly value: string;
  constructor(value: string) {
    this.value = value;
  }
  compareTo(other: ScopeHelperStringValue): boolean {
    return this.value >= other.value;
  }
  getValue(): string {
    return this.value;
  }
  toString(): string {
    return this.value;
  }
}

export class ScopeHelperBooleanValue implements util.ScopeComparable<ScopeHelperBooleanValue> {
  readonly value: boolean;
  constructor(value: boolean) {
    this.value = value;
  }
  compareTo(other: ScopeHelperBooleanValue): boolean {
    return this.value >= other.value;
  }
  getValue(): boolean {
    return this.value;
  }
  toString(): string {
    return this.value.toString();
  }
}

export class ScopeHelperBigIntValue implements util.ScopeComparable<ScopeHelperBigIntValue> {
  readonly value: bigint;
  constructor(value: bigint) {
    this.value = value;
  }
  compareTo(other: ScopeHelperBigIntValue): boolean {
    return this.value >= other.value;
  }
  getValue(): bigint {
    return this.value;
  }
  toString(): string {
    return this.value.toString();
  }
}

export class ScopeHelperDateValue implements util.ScopeComparable<ScopeHelperDateValue> {
  readonly value: Date;
  constructor(value: Date) {
    this.value = value;
  }
  compareTo(other: ScopeHelperDateValue): boolean {
    return this.value.getTime() >= other.value.getTime();
  }
  getValue(): Date {
    return this.value;
  }
  toString(): string {
    return this.value.toString();
  }
}

export class ScopeHelperObjectValue implements util.ScopeComparable<ScopeHelperObjectValue> {
  readonly value: Object;
  constructor(value: Object) {
    this.value = value;
  }
  compareTo(other: ScopeHelperObjectValue): boolean {
    return false;
  }
  getValue(): Object {
    return this.value;
  }
  toString(): string {
    return this.value.toString();
  }
}
