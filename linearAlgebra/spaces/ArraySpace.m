classdef ArraySpace < LinMatSpace
  %ArraySpace
  %   This is the abstract base class for simple vector spaces
  %   consistent with multi-dimensional arrays of values.
  %
  % This base class implements vec and mat, for use in inheriting classes.
  %   
  % See also Re1DSpace, Re2DSpace, ReNDSpace.
  
  methods
    function this = ArraySpace( dims )
      this = this@LinMatSpace( dims );
      
      % Set dimension of the vector space
      this.vdim = prod(dims);
    end
    
    function E_ijk = canvec(this, varargin)
      E_ijk = zeros(this.Mdim);
      E_ijk(varargin{:}) = 1;
    end    
    
    function v = vec(this, M)
      % Vectorize column-wise
      v = M(:);      
    end
    function M = mat(this, v)
      % Reshape vector into original array dimensions
      M = reshape(v,this.Mdim);      
    end
    
    % Conversion methods between linear *ind*ex and array *sub*scripts
    function [varargout] = ind2sub(this, k)
      varargout = cell(1,numel(this.Mdim));
      [varargout{:}] = ind2sub( this.Mdim, k );
      if nargout == 0
        % show all data
        varargout = { cell2mat(varargout) };
      end
    end
    function k = sub2ind(this, varargin)
      k = sub2ind( this.Mdim, varargin{:} );
    end
  end
end

