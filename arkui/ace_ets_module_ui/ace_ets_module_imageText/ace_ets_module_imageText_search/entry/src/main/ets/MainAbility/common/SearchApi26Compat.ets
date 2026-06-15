/**
 * Search API26 属性在部分 SDK 类型声明中缺失，运行时通过接口断言调用。
 */

export enum CompatStrokeJoinStyle {
  MITER_JOIN = 0,
  ROUND_JOIN = 1,
  BEVEL_JOIN = 2
}

interface SearchStrokeJoinApi {
  strokeJoinStyle(value: CompatStrokeJoinStyle | null | undefined): void;
}

interface SearchShaderStyleApi {
  shaderStyle(value: ESObject | null | undefined): void;
}

export function setSearchStrokeJoinStyle(
  instance: SearchAttribute,
  value: CompatStrokeJoinStyle | null | undefined): void {
  const search = instance as ESObject as SearchStrokeJoinApi;
  search.strokeJoinStyle(value);
}

export function setSearchShaderStyle(instance: SearchAttribute, value: ESObject | null | undefined): void {
  const search = instance as ESObject as SearchShaderStyleApi;
  search.shaderStyle(value);
}
