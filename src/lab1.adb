with Ada.Real_Time; use Ada.Real_Time;
with STM32.Board; use STM32.Board;
with STM32.GPIO; use STM32.GPIO;
with STM32.Device; use STM32.Device;

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

   procedure Phase_1 is
   begin
      Turn_On (R_LED);
      Turn_Off (Y_LED);
      Turn_Off (G_LED);

      delay 10.0;
   end Phase_1;

   procedure Phase_2 is
   begin
      Turn_On (R_LED);
      Turn_On (Y_LED);
      Turn_Off (G_LED);

      delay 2.0;
   end Phase_2;

   procedure Phase_3 is
   begin
      Turn_Off (R_LED);
      Turn_Off (Y_LED);
      Turn_On (G_LED);

      delay 10.0;
   end Phase_3;

   procedure Phase_4 is
   begin
      Turn_Off (R_LED);
      Turn_On (Y_LED);
      Turn_Off (G_LED);

      delay 3.0;
   end Phase_4;

begin
   Initi_LEDs;
   loop
      Phase_1;
      Phase_2;
      Phase_3;
      Phase_4;
   end loop;
end Lab1;
