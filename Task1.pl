% ------------------------------------------------------------------------------
% 1. Facts: Gender Definitions
% ------------------------------------------------------------------------------
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% ------------------------------------------------------------------------------
% 2. Facts: Parent Relationships (parent(Parent, Child))
% ------------------------------------------------------------------------------
% Abraham & Mona's children
parent(abraham, herb).
parent(mona, herb).
parent(abraham, homer).
parent(mona, homer).

% Clancy & Jackie's children
parent(clancy, marge).
parent(jackie, marge).
parent(clancy, patty).
parent(jackie, patty).
parent(clancy, selma).
parent(jackie, selma).

% Homer & Marge's children
parent(homer, bart).
parent(marge, bart).
parent(homer, lisa).
parent(marge, lisa).
parent(homer, maggie).
parent(marge, maggie).

% Selma's child
parent(selma, ling).

% ------------------------------------------------------------------------------
% 3. Rules: Relationships Definition
% ------------------------------------------------------------------------------

% Father rule
father(X, Y) :-
    parent(X, Y),
    male(X).

% Mother rule
mother(X, Y) :-
    parent(X, Y),
    female(X).

% Son rule
son(X, Y) :-
    parent(Y, X),
    male(X).

% Daughter rule
daughter(X, Y) :-
    parent(Y, X),
    female(X).

% Brother rule
brother(X, Y) :-
    parent(P, X),
    parent(P, Y),
    male(X),
    X \= Y.

% Sister rule
sister(X, Y) :-
    parent(P, X),
    parent(P, Y),
    female(X),
    X \= Y.

% Grandfather rule
grandfather(X, Y) :-
    parent(X, Z),
    parent(Z, Y),
    male(X).

% Aunt rule (Sister of a parent)
aunt(X, Y) :-
    parent(P, Y),
    sister(X, P).

% Uncle rule (Brother of a parent)
uncle(X, Y) :-
    parent(P, Y),
    brother(X, P).

% Cousin rule
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    (brother(P1, P2) ; sister(P1, P2)),
    X \= Y.

% Ancestor rule (Base + Recursive)
ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).
