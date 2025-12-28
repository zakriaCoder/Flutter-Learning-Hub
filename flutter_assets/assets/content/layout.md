# Module 4: Layout and UI

## Row and Column Explained

### Row
Row arranges widgets horizontally.
Used when items need to appear side by side.

Row(
children: const [
Icon(Icons.star),
Text(" Excellent"),
Icon(Icons.favorite),
],
)

### Column
Column arranges widgets vertically.
Used when items are stacked from top to bottom.

 
DartColumn(
  children: const [
    Text("Welcome"),
    Text("to Flutter"),
    ElevatedButton(
      onPressed: null,
      child: Text("Start Learning"),
    ),
  ],
)


### Real-Life Analogy
Row = people standing in a line
Column = books stacked on a shelf

### Container Widget
Container is a multi-purpose widget used for:

- Styling
- Spacing
- Coloring
- Alignment

DartContainer(
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.symmetric(vertical: 8),
  color: Colors.blue[50],
  child: Text("Styled Text Inside Container"),
)
It acts like a box that holds other widgets.