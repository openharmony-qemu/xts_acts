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
