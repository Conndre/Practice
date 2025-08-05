"""
Tic Tac Toe Player
"""

import math
import copy

X = "X"
O = "O"
EMPTY = None


def initial_state():
    """
    Returns starting state of the board.
    """
    return [[EMPTY, EMPTY, EMPTY],
            [EMPTY, EMPTY, EMPTY],
            [EMPTY, EMPTY, EMPTY]]


def player(board):
    """
    Returns player who has the next turn on a board.
    """
    if board == initial_state():
        return X

    x_count = 0
    o_count = 0

    for row in board:
        x_count += row.count(X)
        o_count += row.count(O)

    if x_count == o_count:
        return X
    else:
        return O


def actions(board):
    """
    Returns set of all possible actions (i, j) available on the board.
    """
    possible_actions = set()

    for row in range(0, len(board)):
        for col in range(0, len(board[0])):
            if board[row][col] == EMPTY:
                possible_actions.add((row, col))

    return possible_actions


# Import copy for result function
def result(board, action):
    """
    Returns the board that results from making move (i, j) on the board.
    """
    if action not in actions(board):
        raise Exception("Not valid action")

    copied_board = copy.deepcopy(board)
    player_turn = player(copied_board)
    copied_board[action[0]][action[1]] = player_turn

    return copied_board


def winner(board):
    """
    Returns the winner of the game, if there is one.
    """
    columns = []

    # Check all options in rows, columns, diagonals
    # Checking rows
    for row in board:
        x_count = row.count(X)
        o_count = row.count(O)
        if x_count == 3:
            return X
        if o_count == 3:
            return O

    # Checking columns
    for j in range(len(board)):
        column = [row[j] for row in board]
        columns.append(column)

    for j in columns:
        x_count = j.count(X)
        o_count = j.count(O)
        if x_count == 3:
            return X
        if o_count == 3:
            return O

    # Checking diagonals
    if board[0][0] == O and board[1][1] == O and board[2][2] == O:
        return O
    if board[0][0] == X and board[1][1] == X and board[2][2] == X:
        return X
    if board[0][2] == O and board[1][1] == O and board[2][0] == O:
        return O
    if board[0][2] == X and board[1][1] == X and board[2][0] == X:
        return X

    # Checking Tie
    return None


def terminal(board):
    """
    Returns True if game is over, False otherwise.
    """
    empty_count = 0

    for row in board:
        empty_count += row.count(EMPTY)

    if empty_count == 0:
        return True
    elif winner(board) is not None:
        return True
    else:
        return False


def utility(board):
    """
    Returns 1 if X has won the game, -1 if O has won, 0 otherwise.
    """
    if winner(board) == X:
        return 1
    elif winner(board) == O:
        return -1
    else:
        return 0


# Return the optimal action by using minimax
def minimax(board):
    """
    Returns the optimal action for the current player on the board.
    """
    if terminal(board):
        return None
    # Return optimal action
    else:
        if player(board) == X:
            optimal_action = None
            v = -math.inf
            for action in actions(board):
                min_val = min_value(result(board, action))
                if min_val > v:
                    v = min_val
                    optimal_action = action
        else:
            optimal_action = None
            v = math.inf
            for action in actions(board):
                max_val = max_value(result(board, action))
                if max_val < v:
                    v = max_val
                    optimal_action = action

        return optimal_action


# Two helper funtions to define minimax(board) function
#  max_value(board) helper function
def max_value(board):
    if terminal(board):
        return utility(board)

    v = -math.inf
    for action in actions(board):
        v = max(v, min_value(result(board, action)))
    return v


# min_value(board) helper function
def min_value(board):
    if terminal(board):
        return utility(board)

    v = math.inf
    for action in actions(board):
        v = min(v, max_value(result(board, action)))
    return v


