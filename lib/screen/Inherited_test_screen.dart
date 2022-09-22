import 'package:flutter/material.dart';

class InheritedTestScreen extends StatefulWidget {
  const InheritedTestScreen({super.key, required this.title});

  final String title;

  @override
  State<InheritedTestScreen> createState() => _InheritedTestScreenState();
}

class _InheritedTestScreenState extends State<InheritedTestScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // InheritedWidget 사용시 의존성이 있는 변수를 사용하지 않는다.
        // child: YellowTile(_counter),
        child: Counter(
          value: _counter,
          child: YellowTile(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Counter extends InheritedWidget {
  final int value;

  const Counter({
    Key? key,
    required this.value,
    required Widget child,
  }) : super(key: key, child: child);

  static Counter of(BuildContext context) {
    final Counter? result = context.dependOnInheritedWidgetOfExactType<Counter>();
    assert(result != null, 'No Counter found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Counter old) {
    return old.value != value;
  }
}

class YellowTile extends StatefulWidget {
  @override
  State<YellowTile> createState() => _YellowTileState();
}

class _YellowTileState extends State<YellowTile> {
  @override
  void didChangeDependencies() {
    print('YellowTile didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('YellowTile build');

    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(0, 10), blurRadius: 16),
        ],
        color: Colors.yellow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          CircleCounter(),
        ],
      ),
    );
  }
}

class CircleCounter extends StatefulWidget {
  @override
  State<CircleCounter> createState() => _CircleCounterState();
}

class _CircleCounterState extends State<CircleCounter> {
  @override
  void didChangeDependencies() {
    print('CircleCounter didChangeDependencies');
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    print('CircleCounter build');
    // InheritedWidget 사용시 BuildContext를 사용 하여 가장 가까이에 있는 InheritedWidget인 Counter를 찾아서 value를 받아옴.
    int counter = Counter.of(context).value;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.orange,
      ),
      child: Text(
        '$counter',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
