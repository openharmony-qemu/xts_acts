'use static';
import SymbolGlyphTest from './SymbolGlyphTest/SymbolGlyph.test';
import SymbolGlyphSymbolColorTest from './SymbolGlyphTest/SymbolGlyphSymbolColor.test';

export default function testsuite() {
  SymbolGlyphTest();
  SymbolGlyphSymbolColorTest();
}