with Ada.Real_Time; use Ada.Real_Time;
with STM32.Board; use STM32.Board;
with STM32.GPIO; use STM32.GPIO;
with STM32.Device; use STM32.Device;
with phase_1; use phase_1;
with phase_2; use phase_2;
with phase_3; use phase_3;
with phase_4; use phase_4;

procedure Lab1 is

   R_LED : User_LED renames PG9;
   Y_LED : User_LED renames PG10;
   G_LED : User_LED renames PG11;

   LEDs : GPIO_Points := R_LED & Y_LED & G_LED;

   Period       : constant Time_Span := Milliseconds (1_000);
   --YPeriod : constant Time_Span := Milliseconds (333);
   Next_Release : Time               := Clock;

   procedure Initi_LEDs is
   begin
      Enable_Clock (LEDs);

      Configure_IO
        (LEDs,
         (Mode => Mode_Out, Output_Type => Push_Pull, Speed => Speed_100MHz,
          Resistors => Floating));
   end Initi_LEDs;

begin
   Initi_LEDs;
   loop
      Phase_1.Execute;
      Phase_2.Execute;
      Phase_3.Execute;
      Phase_4.Execute;
   end loop;
end Lab1;
