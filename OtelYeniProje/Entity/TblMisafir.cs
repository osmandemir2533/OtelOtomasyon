
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace OtelYeniProje.Entity
{

using System;
    using System.Collections.Generic;
    
public partial class TblMisafir
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public TblMisafir()
    {

        this.TblRezervasyon = new HashSet<TblRezervasyon>();

    }


    public int MisafirID { get; set; }

    public string AdSoyad { get; set; }

    public string TC { get; set; }

    public string Mail { get; set; }

    public string Telefon { get; set; }

    public string Adres { get; set; }

    public string Aciklama { get; set; }

    public string KimlikFoto1 { get; set; }

    public string KimlikFoto2 { get; set; }

    public Nullable<int> Ulke { get; set; }

    public Nullable<int> Durum { get; set; }

    public Nullable<int> sehir { get; set; }

    public Nullable<int> ilce { get; set; }



    public virtual TblDurum TblDurum { get; set; }

    public virtual ilceler ilceler { get; set; }

    public virtual iller iller { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<TblRezervasyon> TblRezervasyon { get; set; }

}

}
