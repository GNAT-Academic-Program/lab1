with STM32.Board; use STM32.Board;
with STM32.Device; use STM32.Device;
-- LEDs.ads
package LEDs is
   R_LED : User_LED renames PG9;
   Y_LED : User_LED renames PG10;
   G_LED : User_LED renames PG11;
end LEDs;