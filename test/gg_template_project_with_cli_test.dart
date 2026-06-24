// @license
// Copyright (c) 2026 ggsuite
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:gg_capture_print/gg_capture_print.dart';
import 'package:gg_template_project_with_cli/gg_template_project_with_cli.dart';
import 'package:test/test.dart';
import 'package:gg_args/gg_args.dart';

void main() {
  final messages = <String>[];

  setUp(() {
    messages.clear();
  });

  group('GgTemplateProjectWithCli()', () {
    // #########################################################################
    group('GgTemplateProjectWithCli', () {
      final ggTemplateProjectWithCli = GgTemplateProjectWithCli(
        ggLog: messages.add,
      );

      final CommandRunner<void> runner = CommandRunner<void>(
        'ggTemplateProjectWithCli',
        'Description goes here.',
      )..addCommand(ggTemplateProjectWithCli);

      test('should allow to run the code from command line', () async {
        await capturePrint(
          ggLog: messages.add,
          code: () async => await runner.run([
            'ggTemplateProjectWithCli',
            'my-command',
            '--input',
            'foo',
          ]),
        );
        expect(messages, contains('Running my-command with param foo'));
      });

      // .......................................................................
      test('should show all sub commands', () async {
        final (subCommands, errorMessage) = await missingSubCommands(
          directory: Directory('lib/src/commands'),
          command: ggTemplateProjectWithCli,
        );

        expect(subCommands, isEmpty, reason: errorMessage);
      });
    });
  });
}
