with STM32.Board; use STM32.Board;
with STM32.GPIO; use STM32.GPIO;
with STM32.Device; use STM32.Device;
with LEDs; use LEDs;

package body Phase_2 is
   procedure Execute is
   begin
      Turn_On (R_LED);
      Turn_Off (Y_LED);
      Turn_On (G_LED);

      Turn_Off(R_LED_P);
      Turn_On(G_LED_P);
      delay 2.0;
   end Execute;
end Phase_2;
