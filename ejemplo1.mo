package modelado
  package conectores
    connector positivo
      Modelica.SIunits.ElectricPotential v "Potential at the pin";
      flow Modelica.SIunits.Current i "Current flowing into the pin" annotation(
        Icon(graphics = {Rectangle(origin = {2, -6}, extent = {{-36, 32}, {36, -32}})}));
      annotation(
        Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(origin = {-3, 7}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Cross, extent = {{-59, 35}, {59, -35}})}));
    end positivo;

    connector negativo
      Modelica.SIunits.ElectricPotential v "Potential at the pin";
      flow Modelica.SIunits.Current i "Current flowing into the pin";
      annotation(
        Icon(graphics = {Rectangle(origin = {2, -1}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{-34, 23}, {34, -23}}), Bitmap(extent = {{14, -10}, {14, -10}})}));
    end negativo;

    partial model twopins
      Modelica.SIunits.ElectricPotential v "Potential at the pin";
      flow Modelica.SIunits.Current i "Current flowing into the pin";
      positivo p;
      negativo n;
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;
    end twopins;
  end conectores;

  model corriente
    parameter Modelica.SIunits.Current I(start=1) "Value of constant current";
        extends modelado.conectores.twopins;
      equation
        i = I;
  end corriente;

  model voltaje
    parameter Modelica.SIunits.Voltage V(start=1) "Value of constant voltage";
        extends modelado.conectores.twopins;
      equation
        v = V;
  end voltaje;
end modelado;
