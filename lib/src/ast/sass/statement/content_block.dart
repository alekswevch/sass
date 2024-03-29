// Copyright 2018 Google Inc. Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:source_span/source_span.dart';

import '../../../visitor/interface/statement.dart';
import '../statement.dart';
import '../argument_declaration.dart';
import 'callable_declaration.dart';

/// An anonymous block of code that's invoked for a [ContentRule].
///
/// {@category AST}
final class ContentBlock extends CallableDeclaration {
  ContentBlock(ArgumentDeclaration arguments, Iterable<Statement> children,
      FileSpan span)
      : super("@content", arguments, children, span);

  T accept<T>(StatementVisitor<T> visitor) => visitor.visitContentBlock(this);

  String toString() =>
      (arguments.isEmpty ? "" : " using ($arguments)") +
      " {${children.join(' ')}}";
}
