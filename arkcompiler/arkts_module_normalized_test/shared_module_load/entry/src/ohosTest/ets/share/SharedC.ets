// Shared module (C, module under test): references the non-shared module NonSharedD
// (C->D lazy-loading scenario). Key design: the access to D happens only inside the
// @Sendable gateway method body (i.e. inside the shared module), so calling
// readDThroughC() on each thread triggers that thread's lazy load of D.
// Measured semantics (SDK 6.0.2(22)): the loading thread (the first thread that
// loads C) loads D during C's import resolution; other threads bind C without
// loading D and lazily load D on first access (see doc section 3.6)
import { loadRecorder } from './LoadRecorder';
import { getDLoadMarker } from './NonSharedD';

'use shared'

loadRecorder.recordLoad('SharedC');

@Sendable
class SharedCGateway {
  // The method body executes on the calling thread; accessing D's export inside it
  // triggers that thread's lazy load of D
  readDThroughC(): string {
    return getDLoadMarker();
  }
}

export let sharedCGateway: SharedCGateway = new SharedCGateway();
