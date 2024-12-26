import numpy as np
import matplotlib.pyplot as plt

# Constants
A = 1.2e6  # Richardson constant in A/m^2K^2
e = 1.602e-19  # Electron charge in C
k = 1.381e-23  # Boltzmann constant in J/K
phi = 2.6 * e  # Work function in J (2.6 eV converted to J)
A_filament = 1e-6  # Filament surface area in m^2
sigma = 5.67e-8  # Stefan-Boltzmann constant in W/m^2K^4

# Filament parameters
V_filament = 10  # Filament voltage in V
R_filament = 5  # Filament resistance in Ohms
T_ambient = 300  # Ambient temperature in K
epsilon = 0.9  # Filament emissivity

# Function to calculate thermionic emission current density and current
def thermionic_emission(T):
    J_thermionic = A * T**2 * np.exp(-phi / (k * T))
    I_electron = J_thermionic * A_filament
    return J_thermionic, I_electron

# Function to calculate cathode temperature based on filament power
def cathode_temperature(V_filament, R_filament, T_ambient, epsilon, A_filament):
    I_filament = V_filament / R_filament  # Filament current using Ohm's law
    P_filament = V_filament * I_filament  # Power dissipated in the filament
    # Solve for cathode temperature using Stefan-Boltzmann law
    T_cathode = ((P_filament / (sigma * epsilon * A_filament)) + T_ambient**4)**(1/4)
    return T_cathode

# Temperature range
T_min = 300  # Minimum temperature in K
T_max = 5000  # Maximum temperature in K
T_step = 100  # Temperature step in K
temperatures = np.arange(T_min, T_max + T_step, T_step)

# Calculate current density and current for each temperature
results = np.array([thermionic_emission(T) for T in temperatures])
current_densities = results[:, 0]
currents = results[:, 1]

# Calculate operating point
T_operating = cathode_temperature(V_filament, R_filament, T_ambient, epsilon, A_filament)
J_operating, I_operating = thermionic_emission(T_operating)

# Print operating point
print(f"Operating Temperature: {T_operating:.2f} K")
print(f"Operating Current Density: {J_operating:.2e} A/m²")
print(f"Operating Current: {I_operating:.2e} A")

# Plot the results
fig, ax1 = plt.subplots(figsize=(10, 6))

color = 'tab:blue'
ax1.set_xlabel('Temperature (K)')
ax1.set_ylabel('Current Density (A/m²)', color=color)
ax1.scatter(temperatures, current_densities, label='Thermionic Emission Current Density', color=color, marker='o')
ax1.scatter(T_operating, J_operating, color='red', label='Operating Point (Current Density)', marker='*', s=100)
ax1.tick_params(axis='y', labelcolor=color)

ax2 = ax1.twinx()  # Instantiate a second y-axis that shares the same x-axis
color = 'tab:red'
ax2.set_ylabel('Current (A)', color=color)
ax2.scatter(temperatures, currents, label='Thermionic Emission Current', color=color, marker='x')
ax2.scatter(T_operating, I_operating, color='purple', label='Operating Point (Current)', marker='*', s=100)
ax2.tick_params(axis='y', labelcolor=color)

fig.tight_layout()  # To prevent overlap
plt.title('Thermionic Emission Current Density and Current vs. Temperature')
plt.grid(True)
ax1.legend(loc='upper left')
ax2.legend(loc='upper right')
plt.show()


