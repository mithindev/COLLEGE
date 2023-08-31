import urllib.request # pip3 install requests
from Bio.PDB import PDBParser # pip3 install BioPython

url = 'http://files.rcsb.org/download/1ubq.pdb' # The url from where we should download
pdb_file_name = './1ubq.pdb' # where and name of the file where the downloaded data will be save

urllib.request.urlretrieve(url, pdb_file_name)

# Create a PDB parser
parser = PDBParser()

# Parse the PDB file
structure = parser.get_structure('structure', pdb_file_name)

# Iterate through the structure and extract coordinates
for model in structure:
    for chain in model:
        for residue in chain:
            residue_name = residue.resname  # residue name amino acid name
            residue_number = residue.id[1]  # residue number
            for atom in residue:
                atom_name = atom.get_id() # name of atom
                x,y,z = atom.get_coord() # coordinate
                if atom_name == 'CA':
                    print(f"Residue_number: {residue_number} Atom: {atom_name}, Coordinates: ({x}, {y}, {z})")



            

## Iterate over all atoms in a structure
#for atom in structure.get_atoms():
    print(atom)

# Iterate over all residues in a model
#for residue in model.get_residues():
    print(residue)