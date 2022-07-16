rule win_gemcutter_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.gemcutter."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gemcutter"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { ff15???????? 837d0c01 ff7508 751b }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   837d0c01             | cmp                 dword ptr [ebp + 0xc], 1
            //   ff7508               | push                dword ptr [ebp + 8]
            //   751b                 | jne                 0x1d

        $sequence_1 = { ff15???????? 5e c3 55 8bec 81ec00040000 56 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec00040000         | sub                 esp, 0x400
            //   56                   | push                esi

        $sequence_2 = { 33c0 eb17 8d8500fcffff 50 }
            // n = 4, score = 100
            //   33c0                 | xor                 eax, eax
            //   eb17                 | jmp                 0x19
            //   8d8500fcffff         | lea                 eax, [ebp - 0x400]
            //   50                   | push                eax

        $sequence_3 = { ff15???????? 8bf8 8d8500fcffff 6800040000 50 ff15???????? }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   8d8500fcffff         | lea                 eax, [ebp - 0x400]
            //   6800040000           | push                0x400
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_4 = { 7fda e8???????? 5e c3 50 ff15???????? 5e }
            // n = 7, score = 100
            //   7fda                 | jg                  0xffffffdc
            //   e8????????           |                     
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   50                   | push                eax
            //   ff15????????         |                     
            //   5e                   | pop                 esi

        $sequence_5 = { 8d85f0f8ffff 50 ff15???????? 8d85f0fdffff 53 50 8d45f0 }
            // n = 7, score = 100
            //   8d85f0f8ffff         | lea                 eax, [ebp - 0x710]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8d85f0fdffff         | lea                 eax, [ebp - 0x210]
            //   53                   | push                ebx
            //   50                   | push                eax
            //   8d45f0               | lea                 eax, [ebp - 0x10]

        $sequence_6 = { 56 ff15???????? 8bf8 8d8500fcffff 6800040000 50 }
            // n = 6, score = 100
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   8d8500fcffff         | lea                 eax, [ebp - 0x400]
            //   6800040000           | push                0x400
            //   50                   | push                eax

        $sequence_7 = { 56 56 ff7508 56 ff15???????? 5e }
            // n = 6, score = 100
            //   56                   | push                esi
            //   56                   | push                esi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   56                   | push                esi
            //   ff15????????         |                     
            //   5e                   | pop                 esi

        $sequence_8 = { 3ac3 7412 fec8 8886a0314000 8a843579ffffff }
            // n = 5, score = 100
            //   3ac3                 | cmp                 al, bl
            //   7412                 | je                  0x14
            //   fec8                 | dec                 al
            //   8886a0314000         | mov                 byte ptr [esi + 0x4031a0], al
            //   8a843579ffffff       | mov                 al, byte ptr [ebp + esi - 0x87]

        $sequence_9 = { eb17 8d8500fcffff 50 e8???????? }
            // n = 4, score = 100
            //   eb17                 | jmp                 0x19
            //   8d8500fcffff         | lea                 eax, [ebp - 0x400]
            //   50                   | push                eax
            //   e8????????           |                     

    condition:
        7 of them and filesize < 40960
}