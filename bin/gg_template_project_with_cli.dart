#!/usr/bin/env dart
// @license
// Copyright (c) 2026 ggsuite
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_args/gg_args.dart';
import 'package:gg_log/gg_log.dart';
import 'package:gg_template_project_with_cli/gg_template_project_with_cli.dart';

// .............................................................................
Future<void> run({required List<String> args, required GgLog ggLog}) =>
    GgCommandRunner(
      ggLog: ggLog,
      command: GgTemplateProjectWithCli(ggLog: ggLog),
    ).run(args: args);

// .............................................................................
Future<void> main(List<String> args) async {
  await run(args: args, ggLog: print);
}
