// // lib/screens/grid/grid_view_model.dart
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class GridViewModel extends BaseViewModel {
  List<List<String>> grid = [];
  List<List<bool>> highlighted = [];

  final TextEditingController _mController = TextEditingController();
  final TextEditingController _nController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _entervaluesController = TextEditingController();

  TextEditingController get mController => _mController;
  TextEditingController get nController => _nController;
  TextEditingController get searchController => _searchController;
  TextEditingController get entervaluesController => _entervaluesController;

  bool hasSubmittedM = false;
  int currentRow = 0;
  int currentCol = 0;

  void createGrid() {
    int m = int.tryParse(mController.text) ?? 0;
    int n = int.tryParse(nController.text) ?? 0;

    grid = List.generate(m, (_) => List.generate(n, (_) => ''));
    highlighted = List.generate(m, (_) => List.generate(n, (_) => false));

    currentRow = 0;
    currentCol = 0;

    notifyListeners();
  }

  void setAlphabet(String value) {
    String input = value.toUpperCase();

    for (int i = 0; i < input.length; i++) {
      String alphabet = input[i];

      if (currentRow < grid.length && currentCol < grid[0].length) {
        grid[currentRow][currentCol] = alphabet;

        currentCol++;
        if (currentCol >= grid[0].length) {
          currentCol = 0;
          currentRow++;
        }
      }
    }
    notifyListeners();
  }

  void search() {
    String text = searchController.text;
    resetHighlighted();
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        List<int> result = _search(text.toUpperCase(), i, j);
        if (result.isNotEmpty) {
          highlightWord(result);
        }
      }
    }

    notifyListeners();
  }

  List<int> _search(String text, int row, int col) {
    if (col + text.length <= grid[row].length) {
      bool found = true;
      for (int i = 0; i < text.length; i++) {
        if (grid[row][col + i] != text[i]) {
          found = false;
          break;
        }
      }
      if (found) {
        return [row, col, row, col + text.length - 1];
      }
    }

    if (row + text.length <= grid.length) {
      bool found = true;
      for (int i = 0; i < text.length; i++) {
        if (grid[row + i][col] != text[i]) {
          found = false;
          break;
        }
      }
      if (found) {
        return [row, col, row + text.length - 1, col];
      }
    }

    if (row + text.length <= grid.length &&
        col + text.length <= grid[row].length) {
      bool found = true;
      for (int i = 0; i < text.length; i++) {
        if (grid[row + i][col + i] != text[i]) {
          found = false;
          break;
        }
      }
      if (found) {
        return [row, col, row + text.length - 1, col + text.length - 1];
      }
    }

    return [];
  }

  void highlightWord(List<int> coordinates) {
    int startRow = coordinates[0];
    int startCol = coordinates[1];
    int endRow = coordinates[2];
    int endCol = coordinates[3];

    for (int i = startRow; i <= endRow; i++) {
      for (int j = startCol; j <= endCol; j++) {
        highlighted[i][j] = true;
      }
    }
  }

  void resetHighlighted() {
    for (int i = 0; i < highlighted.length; i++) {
      for (int j = 0; j < highlighted[i].length; j++) {
        highlighted[i][j] = false;
      }
    }
  }

  void clear() {
    _mController.clear();
    _nController.clear();
    _searchController.clear();
    _entervaluesController.clear();
    grid = [];
    highlighted = [];
    hasSubmittedM = false;
    currentRow = 0;
    currentCol = 0;

    notifyListeners();
  }
}
