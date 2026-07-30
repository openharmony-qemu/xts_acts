/** SymbolSpan.fontWeight 第二参 fontWeightConfigs 在部分 SDK 类型中未声明。 */

export interface SymbolSpanFontWeightConfigs {
  enableVariableFontWeight?: boolean;
  enableDeviceFontWeightCategory?: boolean;
}

interface SymbolSpanFontWeightApi {
  fontWeight(value: number | FontWeight | string, options?: SymbolSpanFontWeightConfigs | null): void;
}

class SymbolSpanFontWeightModifier implements AttributeModifier<SymbolSpanAttribute> {
  private weight: number | FontWeight | string;
  private configs: SymbolSpanFontWeightConfigs | null | undefined;
  private hasConfigs: boolean;

  constructor(weight: number | FontWeight | string, configs?: SymbolSpanFontWeightConfigs | null) {
    this.weight = weight;
    this.configs = configs;
    this.hasConfigs = configs !== undefined;
  }

  applyNormalAttribute(instance: SymbolSpanAttribute): void {
    const api = instance as ESObject as SymbolSpanFontWeightApi;
    if (this.hasConfigs) {
      api.fontWeight(this.weight, this.configs);
      return;
    }
    api.fontWeight(this.weight);
  }
}

export function symbolSpanFontWeightModifier(
  weight: number | FontWeight | string,
  configs?: SymbolSpanFontWeightConfigs | null
): SymbolSpanFontWeightModifier {
  return new SymbolSpanFontWeightModifier(weight, configs);
}
