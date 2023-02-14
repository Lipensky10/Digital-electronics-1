# Lab 1: Lukáš Lipenský

### De Morgan's laws

1. Equations of all three versions of logic function f(c,b,a):

   !![rovnice](https://user-images.githubusercontent.com/124770381/218708861-3de9970f-7cc0-456c-86cd-81eca42cc3e6.jpg)
(images/equations.png)

2. Listing of VHDL architecture from design file (`design.vhd`) for all three functions. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture dataflow of gates is
begin
    f_orig_o <= (not(b_i) and a_i) or (c_i and not(b_i or not(a_i)));
    f_nand_o <= not(not(not(b_i)and a_i) and not(c_i and not(b_i) and a_i);; -- MODIFY THIS FUNCTION
    f_nor_o  <= not(not(a_i)or(b_i)) or not(not(c_i)or b_i or not(a_i));  -- MODIFY THIS FUNCTION
end architecture dataflow;
```

3. Complete table with logic functions' values:

   | **c** | **b** |**a** | **f_ORIG** | **f_(N)AND** | **f_(N)OR** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0 | 0 | 0 | 0 | 0 |
   | 0 | 0 | 1 | 1 | 1 | 1 |
   | 0 | 1 | 0 | 0 | 0 | 0 |
   | 0 | 1 | 1 | 0 | 0 | 0 |
   | 1 | 0 | 0 | 0 | 0 | 0 |
   | 1 | 0 | 1 | 1 | 1 | 1 |
   | 1 | 1 | 0 | 0 | 0 | 0 |
   | 1 | 1 | 1 | 0 | 0 | 0 |

### Distributive laws

1. Screenshot with simulated time waveforms. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![prubehy](https://user-images.githubusercontent.com/124770381/217551205-7b1555d6-f6cc-40c4-8a34-563a16026d46.PNG)


2. Link to your public EDA Playground example:

   https://www.edaplayground.com/x/VUaG
