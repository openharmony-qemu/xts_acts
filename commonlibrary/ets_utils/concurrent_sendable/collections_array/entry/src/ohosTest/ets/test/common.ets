export const BIND_ERROR_CODE: number = 10200011;
export const CONCURRENT_ERROR_CODE: number = 10200201;


@Sendable
export class CrossThreadApiResult {
  public containsAllResult: boolean = false;
  public retainAllResult: boolean = false;
  public retainAllPredicateResult: boolean = false;
  public finalLength: number = 0;
}