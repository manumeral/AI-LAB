final_state([1,2,3,
      4,0,5,
      6,7,8]).
one_step([Pos1,0,Pos3, Pos4,Pos5,Pos6, Pos7,Pos8,Pos9],
     [0,Pos1,Pos3, Pos4,Pos5,Pos6, Pos7,Pos8,Pos9]).
one_step([Pos1,Pos2,0, Pos4,Pos5,Pos6, Pos7,Pos8,Pos9],
     [Pos1,0,Pos2, Pos4,Pos5,Pos6, Pos7,Pos8,Pos9]).

%% one_step left in the middle row
one_step([Pos1,Pos2,Pos3, Pos4,0,Pos6,Pos7,Pos8,Pos9],
     [Pos1,Pos2,Pos3, 0,Pos4,Pos6,Pos7,Pos8,Pos9]).
one_step([Pos1,Pos2,Pos3, Pos4,Pos5,0,Pos7,Pos8,Pos9],
     [Pos1,Pos2,Pos3, Pos4,0,Pos5,Pos7,Pos8,Pos9]).

%% one_step left in the bottom row
one_step([Pos1,Pos2,Pos3, Pos4,Pos5,Pos6, Pos7,0,Pos9],
     [Pos1,Pos2,Pos3, Pos4,Pos5,Pos6, 0,Pos7,Pos9]).
one_step([Pos1,Pos2,Pos3, Pos4,Pos5,Pos6, Pos7,Pos8,0],
     [Pos1,Pos2,Pos3, Pos4,Pos5,Pos6, Pos7,0,Pos8]).

%% one_step right in the top row 
one_step([0,Pos2,Pos3, Pos4,Pos5,Pos6, Pos7,Pos8,Pos9],
     [Pos2,0,Pos3, Pos4,Pos5,Pos6, Pos7,Pos8,Pos9]).
one_step([Pos1,0,Pos3, Pos4,Pos5,Pos6, Pos7,Pos8,Pos9],
     [Pos1,Pos3,0, Pos4,Pos5,Pos6, Pos7,Pos8,Pos9]).

%% one_step right in the middle row 
one_step([Pos1,Pos2,Pos3, 0,Pos5,Pos6, Pos7,Pos8,Pos9],
     [Pos1,Pos2,Pos3, Pos5,0,Pos6, Pos7,Pos8,Pos9]).
one_step([Pos1,Pos2,Pos3, Pos4,0,Pos6, Pos7,Pos8,Pos9],
     [Pos1,Pos2,Pos3, Pos4,Pos6,0, Pos7,Pos8,Pos9]).

%% one_step right in the bottom row
one_step([Pos1,Pos2,Pos3, Pos4,Pos5,Pos6,0,Pos8,Pos9],
     [Pos1,Pos2,Pos3, Pos4,Pos5,Pos6,Pos8,0,Pos9]).
one_step([Pos1,Pos2,Pos3, Pos4,Pos5,Pos6,Pos7,0,Pos9],
     [Pos1,Pos2,Pos3, Pos4,Pos5,Pos6,Pos7,Pos9,0]).

%% one_step up from the middle row
one_step([Pos1,Pos2,Pos3, 0,Pos5,Pos6, Pos7,Pos8,Pos9],
     [0,Pos2,Pos3, Pos1,Pos5,Pos6, Pos7,Pos8,Pos9]).
one_step([Pos1,Pos2,Pos3, Pos4,0,Pos6, Pos7,Pos8,Pos9],
     [Pos1,0,Pos3, Pos4,Pos2,Pos6, Pos7,Pos8,Pos9]).
one_step([Pos1,Pos2,Pos3, Pos4,Pos5,0, Pos7,Pos8,Pos9],
     [Pos1,Pos2,0, Pos4,Pos5,Pos3, Pos7,Pos8,Pos9]).

%% one_step up from the bottom row
one_step([Pos1,Pos2,Pos3, Pos4,Pos5,Pos6, Pos7,0,Pos9],
     [Pos1,Pos2,Pos3, Pos4,0,Pos6, Pos7,Pos5,Pos9]).
one_step([Pos1,Pos2,Pos3, Pos4,Pos5,Pos6, Pos7,Pos8,0],
     [Pos1,Pos2,Pos3, Pos4,Pos5,0, Pos7,Pos8,Pos6]).
one_step([Pos1,Pos2,Pos3, Pos4,Pos5,Pos6, 0,Pos8,Pos9],
     [Pos1,Pos2,Pos3, 0,Pos5,Pos6, Pos4,Pos8,Pos9]).

%% one_step down from the top row
one_step([0,Pos2,Pos3, Pos4,Pos5,Pos6, Pos7,Pos8,Pos9],
     [Pos4,Pos2,Pos3, 0,Pos5,Pos6, Pos7,Pos8,Pos9]).
one_step([Pos1,0,Pos3, Pos4,Pos5,Pos6, Pos7,Pos8,Pos9],
     [Pos1,Pos5,Pos3, Pos4,0,Pos6, Pos7,Pos8,Pos9]).
one_step([Pos1,Pos2,0, Pos4,Pos5,Pos6, Pos7,Pos8,Pos9],
     [Pos1,Pos2,Pos6, Pos4,Pos5,0, Pos7,Pos8,Pos9]).

%% one_step down from the middle row
one_step([Pos1,Pos2,Pos3, 0,Pos5,Pos6, Pos7,Pos8,Pos9],
     [Pos1,Pos2,Pos3, Pos7,Pos5,Pos6, 0,Pos8,Pos9]).
one_step([Pos1,Pos2,Pos3, Pos4,0,Pos6, Pos7,Pos8,Pos9],
     [Pos1,Pos2,Pos3, Pos4,Pos8,Pos6, Pos7,0,Pos9]).
one_step([Pos1,Pos2,Pos3, Pos4,Pos5,0, Pos7,Pos8,Pos9],
     [Pos1,Pos2,Pos3, Pos4,Pos5,Pos9, Pos7,Pos8,0]).


dfs(S, Path, Path) :- final_state(S).

dfs(S, Checked, Path) :-one_step(S, S2),\+member(S2, Checked),dfs(S2, [S2|Checked], Path).


