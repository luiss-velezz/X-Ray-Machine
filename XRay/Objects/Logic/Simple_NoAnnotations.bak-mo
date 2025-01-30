within XRay.Objects.Logic;

model Simple_NoAnnotations "Simple state machine"
inner Integer i(start =0);
block State1
outer output Integer i;
output Integer j(start =10);
equation
i = previous(i) + 2;
j = previous(j) - 1;
end State1;
State1 state1;
block State2
outer output Integer i;
equation
i = previous(i) - 1;
end State2;
State2 state2;
equation
transition(state1 ,state2 ,i > 10, immediate =false ,
reset=true , synchronize =false ,priority =1);
transition(state2 ,state1 ,i < 1, immediate =false ,
reset=true , synchronize =false , priority =1);
initialState(state1);
end Simple_NoAnnotations ;
