// Shared module (B): referenced by the non-shared module NonSharedA (A->B scenario).
// Records one load at top level; exports the unique load marker bLoadId — the value
// read through A from every thread must stay identical (B remains globally unique
// through A)
import { loadRecorder } from './LoadRecorder';

'use shared'

loadRecorder.recordLoad('SharedB');

export let bLoadId: string = `b-load-${Date.now()}-${Math.floor(Math.random() * 1000000)}`;
