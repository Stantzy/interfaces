program StackOfLongintegers;		{ sol.pas }
type
	LongItemPtr = ^LongItem;
	LongItem = record
		data: longint;
		next: LongItemPtr;
	end;

type
	StackOfLongints = LongItemPtr;

procedure SOLInit(var stack: StackOfLongints);
begin
	stack := nil;
end;

procedure SOLPush(var stack: StackOfLongints; n: longint);
var
	tmp: LongItemPtr;
begin
	new(tmp);
	tmp^.data := n;
	tmp^.next := stack;
	stack := tmp
end;

procedure SOLPop(var stack: StackOfLongints; var n: longint);
var
	tmp: LongItemPtr;
begin
	n := stack^.data;
	tmp := stack;
	stack := stack^.next;
	dispose(tmp)
end;

function SOLisEmpty(var stack: StackOfLongints) : boolean;
begin
	SOLisEmpty := stack = nil
end;

var
	s: StackOfLongints;
	n: longint;
begin
end.
