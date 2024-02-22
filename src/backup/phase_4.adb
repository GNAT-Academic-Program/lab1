with STM32.Board; use STM32.Board;
with STM32.GPIO; use STM32.GPIO;
with STM32.Device; use STM32.Device;
with LEDs; use LEDs;

package body Phase_4 is
   procedure Execute is
   begin
      Turn_Off (R_LED);
      Turn_On (Y_LED);
      Turn_On (G_LED);

      Turn_On(R_LED_P);
      Turn_Off(G_LED_P);
      delay 3.0;
   end Execute;
end Phase_4;
