program QueueOfLongintegers;		{ qol.pas }
type
	LongItemPtr = ^LongItem;
	LongItem = record
		data: longint;
		next: LongItemPtr;
	end;

type
	QueueOfLongints = record
		first, last: LongItemPtr;
	end;

procedure QOLInit(var queue: QueueOfLongints);
begin
	queue.first := nil;
	queue.last := nil;
end;

procedure QOLPut(var queue: QueueOfLongints; n: longint);
begin
	if queue.first = nil then
	begin
		new(queue.first);
		queue.last := queue.first
	end
	else
	begin
		new(queue.last^.next);
		queue.last := queue.last^.next
	end;
	queue.last^.data := n;
	queue.last^.next := nil
end;

procedure QOLGet(var queue: QueueOfLongints; var n: longint);
var
	tmp: LongItemPtr;
begin
	tmp := queue.first;
	n := queue.first^.data;
	queue.first := queue.first^.next;
	if queue.first = nil then
		queue.last := nil;
	dispose(tmp)
end;

function QOLisEmpty(var queue: QueueOfLongints) : boolean;
begin
	QOLisEmpty := queue.first = nil
end;

var
	q: QueueOfLongints;
	n: longint;
begin
end.
