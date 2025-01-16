const Map<String, List<List<String>>> ledChars = {
  '.': [
    ['.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.']
  ],
  'A': [
    ['.', '.', 'O', 'O', 'O', '.', '.', '.'],
    ['.', 'O', 'O', 'O', 'O', 'O', '.', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', 'O', 'O', 'O', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.']
  ],
  'B': [
    ['O', 'O', 'O', 'O', 'O', 'O', '.', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', 'O', 'O', 'O', 'O', '.', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', 'O', 'O', 'O', 'O', '.', '.']
  ],
  'C': [
    ['.', 'O', 'O', 'O', 'O', 'O', '.', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['.', 'O', 'O', 'O', 'O', 'O', '.', '.']
  ],
  'D': [
    ['O', 'O', 'O', 'O', 'O', '.', '.', '.'],
    ['O', 'O', '.', '.', 'O', 'O', '.', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', 'O', 'O', '.', '.'],
    ['O', 'O', 'O', 'O', 'O', '.', '.', '.']
  ],
  'E': [
    ['O', 'O', 'O', 'O', 'O', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', 'O', 'O', 'O', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', 'O', 'O', 'O', 'O', 'O', '.']
  ],
  'F': [
    ['O', 'O', 'O', 'O', 'O', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', 'O', 'O', 'O', 'O', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.']
  ],
  'G': [
    ['.', 'O', 'O', 'O', 'O', 'O', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', 'O', 'O', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['.', 'O', 'O', 'O', 'O', 'O', '.', '.']
  ],
  'H': [
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', 'O', 'O', 'O', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.']
  ],
  'I': [
    ['.', 'O', 'O', 'O', 'O', 'O', '.', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.'],
    ['.', 'O', 'O', 'O', 'O', 'O', '.', '.']
  ],
  'J': [
    ['.', '.', '.', '.', '.', '.', 'O', '.'],
    ['.', '.', '.', '.', '.', '.', 'O', '.'],
    ['.', '.', '.', '.', '.', '.', 'O', '.'],
    ['.', '.', '.', '.', '.', '.', 'O', '.'],
    ['.', '.', '.', '.', '.', '.', 'O', '.'],
    ['O', '.', '.', '.', '.', '.', 'O', '.'],
    ['.', 'O', 'O', 'O', 'O', 'O', '.', '.']
  ],
  'K': [
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', 'O', 'O', '.', '.'],
    ['O', 'O', '.', 'O', 'O', '.', '.', '.'],
    ['O', 'O', 'O', 'O', 'O', '.', '.', '.'],
    ['O', 'O', '.', 'O', 'O', '.', '.', '.'],
    ['O', 'O', '.', '.', 'O', 'O', '.', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.']
  ],
  'L': [
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', 'O', 'O', 'O', 'O', 'O', '.']
  ],
  'M': [
    ['O', '.', '.', '.', '.', '.', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', '.', 'O', '.', 'O', '.', 'O', '.'],
    ['O', '.', '.', 'O', '.', '.', 'O', '.'],
    ['O', '.', '.', '.', '.', '.', 'O', '.'],
    ['O', '.', '.', '.', '.', '.', 'O', '.'],
    ['O', '.', '.', '.', '.', '.', 'O', '.']
  ],
  'N': [
    ['O', '.', '.', '.', '.', '.', 'O', '.'],
    ['O', 'O', '.', '.', '.', '.', 'O', '.'],
    ['O', '.', 'O', '.', '.', '.', 'O', '.'],
    ['O', '.', '.', 'O', '.', '.', 'O', '.'],
    ['O', '.', '.', '.', 'O', '.', 'O', '.'],
    ['O', '.', '.', '.', '.', 'O', 'O', '.'],
    ['O', '.', '.', '.', '.', '.', 'O', '.']
  ],
  'O': [
    ['.', 'O', 'O', 'O', 'O', 'O', '.', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['.', 'O', 'O', 'O', 'O', 'O', '.', '.']
  ],
  'P': [
    ['O', 'O', 'O', 'O', 'O', 'O', '.', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', 'O', 'O', 'O', 'O', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.']
  ],
  'Q': [
    ['.', 'O', 'O', 'O', 'O', 'O', '.', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', 'O', 'O', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', '.', 'O', '.'],
    ['.', 'O', 'O', 'O', 'O', 'O', 'O', '.']
  ],
  'R': [
    ['O', 'O', 'O', 'O', 'O', 'O', '.', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', 'O', 'O', 'O', 'O', '.', '.'],
    ['O', 'O', '.', 'O', 'O', '.', '.', '.'],
    ['O', 'O', '.', '.', 'O', 'O', '.', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.']
  ],
  'S': [
    ['.', 'O', 'O', 'O', 'O', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['O', 'O', '.', '.', '.', '.', '.', '.'],
    ['.', 'O', 'O', 'O', 'O', 'O', 'O', '.'],
    ['.', '.', '.', '.', '.', '.', 'O', '.'],
    ['.', '.', '.', '.', '.', '.', 'O', '.'],
    ['O', 'O', 'O', 'O', 'O', 'O', '.', '.']
  ],
  'T': [
    ['O', 'O', 'O', 'O', 'O', 'O', 'O', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.']
  ],
  'U': [
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['.', 'O', 'O', 'O', 'O', 'O', '.', '.']
  ],
  'V': [
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['.', 'O', 'O', '.', 'O', 'O', '.', '.'],
    ['.', 'O', 'O', '.', 'O', 'O', '.', '.'],
    ['.', '.', 'O', 'O', 'O', '.', '.', '.']
  ],
  'W': [
    ['O', '.', '.', '.', '.', '.', 'O', '.'],
    ['O', '.', '.', '.', '.', '.', 'O', '.'],
    ['O', '.', '.', '.', '.', '.', 'O', '.'],
    ['O', '.', '.', 'O', '.', '.', 'O', '.'],
    ['O', '.', '.', 'O', '.', '.', 'O', '.'],
    ['O', '.', 'O', '.', 'O', '.', 'O', '.'],
    ['.', 'O', '.', '.', '.', 'O', '.', '.']
  ],
  'X': [
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['.', 'O', 'O', '.', 'O', 'O', '.', '.'],
    ['.', '.', 'O', 'O', 'O', '.', '.', '.'],
    ['.', 'O', 'O', '.', 'O', 'O', '.', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.']
  ],
  'Y': [
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['O', 'O', '.', '.', '.', 'O', 'O', '.'],
    ['.', 'O', 'O', '.', 'O', 'O', '.', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.']
  ],
  'Z': [
    ['O', 'O', 'O', 'O', 'O', 'O', 'O', '.'],
    ['.', '.', '.', '.', '.', 'O', 'O', '.'],
    ['.', '.', '.', '.', 'O', 'O', '.', '.'],
    ['.', '.', '.', 'O', 'O', '.', '.', '.'],
    ['.', '.', 'O', 'O', '.', '.', '.', '.'],
    ['.', 'O', 'O', '.', '.', '.', '.', '.'],
    ['O', 'O', 'O', 'O', 'O', 'O', 'O', '.']
  ],
};

List<List<String>> stretchCharacter(List<List<String>> character, int newRows, int newCols) {
  // Initialize the stretched character representation
  List<List<String>> stretched = List.generate(newRows, (_) => List.filled(newCols, ' '));

  // Calculate row and column ratios (cast to double for floating-point calculations)
  double rowRatio = newRows / character.length;
  double colRatio = newCols / character[0].length;

  // Iterate through each element in the stretched character grid
  for (int i = 0; i < newRows; i++) {
    for (int j = 0; j < newCols; j++) {
      // Calculate the corresponding index in the original character representation
      // using floor division to get the closest integer index
      int oldI = (i / rowRatio).floor();
      int oldJ = (j / colRatio).floor();
      stretched[i][j] = character[oldI][oldJ];
    }
  }

  return stretched;
}

List<List<String>> generateLedGrid(String text, int numRows, int numCols) {
  // Initialize the LED grid as an empty list of lists of strings
  List<List<String>> grid = List.generate(numRows, (_) => List.filled(text.length * numCols, ' '));

  // Stretch each character and add it to the grid
  int colIndex = 0;
  for (int i = 0; i < text.length; i++) {
    String c = text[i]; // Corrected 'string' to 'String'
    if (ledChars.containsKey(c)) {
      List<List<String>> stretchedChar = stretchCharacter(ledChars[c]!, numRows, numCols);
      for (int j = 0; j < numRows; j++) {
        for (int k = 0; k < numCols; k++) {
          grid[j][colIndex + k] = stretchedChar[j][k];
        }
      }
      colIndex += numCols;
    }
  }

  return grid;
}

String convertBToString(List<List<String>> listOfLists) {
  String result = '';

  for (List<String> innerList in listOfLists) {
    result += innerList.join(); // Concatenate strings in inner list without spaces
  }

  return result;
}

String convertAndReturnString(String message, int rows, int columns) {

  String text_to_display = message;

  int num_rows = rows;
  int num_cols = rows;

  List<List<String>> A = generateLedGrid(text_to_display, num_rows, num_cols);

  int numColsB = columns;
  int numRowsB = num_rows;
  int numRowsA = A.length;
  int numColsA = A.isNotEmpty ? A[0].length : 0;

  List<List<String>> B = List.generate(numRowsB, (_) => List.filled(numColsB, '.'));

  int offset = 0;

  for (int i = 0; i < numRowsB; ++i) {
    for (int j = 0; j < numColsB; ++j) {
      int index = (j + offset) % numColsA;
      B[i][j] = A[i][index];
    }
  }
  String ans = convertBToString(B);
  return ans;
}