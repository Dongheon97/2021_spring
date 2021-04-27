## Linked List
class Node:
    def __init__(self, row, col):
        self.row = row
        self.col = col
        self.next = None

class LinkedList:
    # 초기화 메소드
    def __init__(self, row, col):
        self.num_of_data = 0
        self.head = Node(row, col)


    def add(self, row, col):
        cur = self.head
        new = Node(row, col)
        self.head = new
        new.next = cur
        self.num_of_data += 1

    def remove(self):
        if (not self.isEmpty()):
            cur = self.head
            row = cur.row
            col = cur.col
            self.head = cur.next
            self.num_of_data -= 1
            return row, col



    def isEmpty(self):
        if(self.num_of_data == 0):
            return True
        return False

    # next 메소드 (search2 - current 노드의 다음 노드 검색, 이전에 first 메소드가 한번은 실행되어야 함)
    def next(self):
        if self.current.next == None:
            return None

        self.before = self.current
        self.current = self.current.next

        return self.current.data

    def peek(self):
        cur = self.head
        row = cur.row
        col = cur.col
        return row, col

    def size(self):
        return self.num_of_data


if __name__ == '__main__':
    list = LinkedList(0, 0)
    list.add(1, 2)
    list.add(3, 4)
    list.add(5, 6)
    list.add(7, 8)
    print(list, '\n')
    while(not list.isEmpty()):
        y, x = list.remove()
        print(y, x, '\n')
        print(list, '\n')